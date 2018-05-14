# frozen_string_literal: true

require 'spec_helper'

describe EveOnline::ESI::Base do
  specify { expect(described_class).to be_a(Memoist) }

  describe '#initialize' do
    context 'with options' do
      let(:options) do
        {
          token: 'token123',
          read_timeout: 30,
          open_timeout: 45
        }
      end

      subject { described_class.new(options) }

      its(:token) { should eq('token123') }

      its(:_read_timeout) { should eq(30) }

      its(:_open_timeout) { should eq(45) }
    end

    context 'without options' do
      its(:token) { should eq(nil) }

      its(:parser) { should eq(JSON) }

      its(:_read_timeout) { should eq(60) }

      its(:_open_timeout) { should eq(60) }
    end
  end

  describe '#url' do
    specify { expect { subject.url }.to raise_error(NotImplementedError) }
  end

  describe '#scope' do
    specify { expect { subject.scope }.to raise_error(NotImplementedError) }
  end

  describe '#user_agent' do
    specify { expect(subject.user_agent).to eq("EveOnline API (https://github.com/biow0lf/eve_online) v#{ EveOnline::VERSION }") }
  end

  describe '#read_timeout' do
    before do
      #
      # subject.client.options.timeout
      #
      expect(subject).to receive(:client) do
        double.tap do |a|
          expect(a).to receive(:options) do
            double.tap do |b|
              expect(b).to receive(:timeout)
            end
          end
        end
      end
    end

    specify { expect { subject.read_timeout }.not_to raise_error }
  end

  describe '#read_timeout=' do
    let(:value) { double }

    before do
      #
      # subject.client.options.timeout = value
      #
      expect(subject).to receive(:client) do
        double.tap do |a|
          expect(a).to receive(:options) do
            double.tap do |b|
              expect(b).to receive(:timeout=).with(value)
            end
          end
        end
      end
    end

    specify { expect { subject.send(:read_timeout=, value) }.not_to raise_error }
  end

  describe '#open_timeout' do
    before do
      #
      # subject.client.options.timeout
      #
      expect(subject).to receive(:client) do
        double.tap do |a|
          expect(a).to receive(:options) do
            double.tap do |b|
              expect(b).to receive(:open_timeout)
            end
          end
        end
      end
    end

    specify { expect { subject.open_timeout }.not_to raise_error }
  end

  describe '#open_timeout=' do
    let(:value) { double }

    before do
      #
      # subject.client.options.open_timeout = value
      #
      expect(subject).to receive(:client) do
        double.tap do |a|
          expect(a).to receive(:options) do
            double.tap do |b|
              expect(b).to receive(:open_timeout=).with(value)
            end
          end
        end
      end
    end

    specify { expect { subject.send(:open_timeout=, value) }.not_to raise_error }
  end

  describe '#client' do
    context 'when @client set' do
      let(:client) { double }

      before { subject.instance_variable_set(:@client, client) }

      specify { expect(subject.client).to eq(client) }
    end

    context 'when @client not set' do
      let(:client) { double }

      before { expect(Faraday).to receive(:new).and_return(client) }

      let(:user_agent) { double }

      before { expect(subject).to receive(:user_agent).and_return(user_agent) }

      before do
        #
        # faraday.headers[:user_agent] = user_agent
        #
        expect(client).to receive(:headers) do
          double.tap do |a|
            expect(a).to receive(:[]=).with(:user_agent, user_agent)
          end
        end
      end

      let(:_read_timeout) { double }

      before { expect(subject).to receive(:_read_timeout).and_return(_read_timeout) }

      before do
        expect(client).to receive(:options) do
          double.tap do |a|
            expect(a).to receive(:timeout=).with(_read_timeout)
          end
        end
      end

      let(:_open_timeout) { double }

      before { expect(subject).to receive(:_open_timeout).and_return(_open_timeout) }

      before do
        expect(client).to receive(:options) do
          double.tap do |a|
            expect(a).to receive(:open_timeout=).with(_open_timeout)
          end
        end
      end

      context 'when token not present' do
        before { expect(client).not_to receive(:authorization) }

        specify { expect(subject.client).to eq(client) }

        specify { expect { subject.client }.to change { subject.instance_variable_get(:@client) }.from(nil).to(client) }
      end

      context 'when token is present' do
        let(:options) { { token: 'token123' } }

        subject { described_class.new(options) }

        before { expect(client).to receive(:authorization).with(:Bearer, 'token123') }

        specify { expect(subject.client).to eq(client) }

        specify { expect { subject.client }.to change { subject.instance_variable_get(:@client) }.from(nil).to(client) }
      end
    end
  end

  describe '#resource' do
    context 'when @resource set' do
      let(:resource) { double }

      before { subject.instance_variable_set(:@resource, resource) }

      specify { expect(subject.resource).to eq(resource) }
    end

    context 'when @resource not set' do
      let(:resource) { double }

      let(:client) { double }

      let(:url) { double }

      before { expect(subject).to receive(:url).and_return(url) }

      before { expect(subject).to receive(:client).and_return(client) }

      before { expect(client).to receive(:get).with(url).and_return(resource) }

      specify { expect { subject.resource }.not_to raise_error }

      specify { expect { subject.resource }.to change { subject.instance_variable_get(:@resource) }.from(nil).to(resource) }
    end
  end

  # describe '#content' do
  #   context 'ok' do
  #     let(:url) { double }
  #
  #     before { expect(subject).to receive(:url).and_return(url) }
  #
  #     let(:user_agent) { double }
  #
  #     before { expect(subject).to receive(:user_agent).and_return(user_agent) }
  #
  #     let(:faraday) { double }
  #
  #     before do
  #       #
  #       # Faraday.new => faraday
  #       #
  #       expect(Faraday).to receive(:new).and_return(faraday)
  #     end
  #
  #     before do
  #       #
  #       # faraday.headers[:user_agent] = user_agent
  #       #
  #       expect(faraday).to receive(:headers) do
  #         double.tap do |a|
  #           expect(a).to receive(:[]=).with(:user_agent, user_agent)
  #         end
  #       end
  #     end
  #
  #     before do
  #       expect(faraday).to receive(:options) do
  #         double.tap do |a|
  #           expect(a).to receive(:timeout=).with(60)
  #         end
  #       end
  #     end
  #
  #     before do
  #       expect(faraday).to receive(:options) do
  #         double.tap do |a|
  #           expect(a).to receive(:open_timeout=).with(60)
  #         end
  #       end
  #     end
  #
  #     before do
  #       #
  #       # faraday.get(url).body
  #       #
  #       expect(faraday).to receive(:get).with(url) do
  #         double.tap do |a|
  #           expect(a).to receive(:body)
  #         end
  #       end
  #     end
  #
  #     context 'without token' do
  #       before { expect(faraday).not_to receive(:authorization) }
  #
  #       specify { expect { subject.content }.not_to raise_error }
  #
  #       specify { expect { subject.content }.to change { subject.instance_variable_defined?(:@_memoized_content) }.from(false).to(true) }
  #     end
  #
  #     context 'with token' do
  #       let(:options) { { token: 'token123' } }
  #
  #       subject { described_class.new(options) }
  #
  #       before do
  #         #
  #         # faraday.authorization(:Bearer, token)
  #         #
  #         expect(faraday).to receive(:authorization).with(:Bearer, 'token123')
  #       end
  #
  #       specify { expect { subject.content }.not_to raise_error }
  #
  #       specify { expect { subject.content }.to change { subject.instance_variable_defined?(:@_memoized_content) }.from(false).to(true) }
  #     end
  #   end
  #
  #   context 'exception' do
  #     before do
  #       #
  #       # Faraday.new => raise Faraday::TimeoutError
  #       #
  #       expect(Faraday).to receive(:new).and_raise(Faraday::TimeoutError)
  #     end
  #
  #     specify { expect { subject.content }.to raise_error(EveOnline::Exceptions::TimeoutException) }
  #   end
  # end

  describe '#response' do
    let(:parser) { double }

    let(:content) { 'some content to parse' }

    before { expect(subject).to receive(:content).and_return(content) }

    before { expect(subject).to receive(:parser).and_return(parser) }

    before { expect(parser).to receive(:parse).with(content) }

    specify { expect { subject.response }.not_to raise_error }

    specify { expect { subject.response }.to change { subject.instance_variable_defined?(:@_memoized_response) }.from(false).to(true) }
  end

  # private methods

  describe '#parse_datetime_with_timezone' do
    let(:value) { double }

    before do
      #
      # ActiveSupport::TimeZone['UTC'].parse(value)
      #
      expect(ActiveSupport::TimeZone).to receive(:[]).with('UTC') do
        double.tap do |a|
          expect(a).to receive(:parse).with(value)
        end
      end
    end

    specify { expect { subject.send(:parse_datetime_with_timezone, value) }.not_to raise_error }
  end
end

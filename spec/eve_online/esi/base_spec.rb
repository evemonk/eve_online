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

  # def read_timeout=(value)
  #   client.options.timeout = value
  # end
  #
  # def open_timeout
  #   client.options.open_timeout
  # end
  #
  # def open_timeout=(value)
  #   client.options.open_timeout = value
  # end

  # def client
  #   @client ||= begin
  #     faraday = Faraday.new
  #
  #     faraday.headers[:user_agent] = user_agent
  #     faraday.authorization(:Bearer, token) if token
  #     faraday.options.timeout = @read_timeout
  #     faraday.options.open_timeout = @open_timeout
  #     faraday
  #   end
  # end
  #
  # def resource
  #   @resource ||= client.get(url)
  # end

  describe '#content' do
    context 'ok' do
      let(:url) { double }

      before { expect(subject).to receive(:url).and_return(url) }

      let(:user_agent) { double }

      before { expect(subject).to receive(:user_agent).and_return(user_agent) }

      let(:faraday) { double }

      before do
        #
        # Faraday.new => faraday
        #
        expect(Faraday).to receive(:new).and_return(faraday)
      end

      before do
        #
        # faraday.headers[:user_agent] = user_agent
        #
        expect(faraday).to receive(:headers) do
          double.tap do |a|
            expect(a).to receive(:[]=).with(:user_agent, user_agent)
          end
        end
      end

      before do
        expect(faraday).to receive(:options) do
          double.tap do |a|
            expect(a).to receive(:timeout=).with(60)
          end
        end
      end

      before do
        expect(faraday).to receive(:options) do
          double.tap do |a|
            expect(a).to receive(:open_timeout=).with(60)
          end
        end
      end

      before do
        #
        # faraday.get(url).body
        #
        expect(faraday).to receive(:get).with(url) do
          double.tap do |a|
            expect(a).to receive(:body)
          end
        end
      end

      context 'without token' do
        before { expect(faraday).not_to receive(:authorization) }

        specify { expect { subject.content }.not_to raise_error }

        specify { expect { subject.content }.to change { subject.instance_variable_defined?(:@_memoized_content) }.from(false).to(true) }
      end

      context 'with token' do
        let(:options) { { token: 'token123' } }

        subject { described_class.new(options) }

        before do
          #
          # faraday.authorization(:Bearer, token)
          #
          expect(faraday).to receive(:authorization).with(:Bearer, 'token123')
        end

        specify { expect { subject.content }.not_to raise_error }

        specify { expect { subject.content }.to change { subject.instance_variable_defined?(:@_memoized_content) }.from(false).to(true) }
      end
    end

    context 'exception' do
      before do
        #
        # Faraday.new => raise Faraday::TimeoutError
        #
        expect(Faraday).to receive(:new).and_raise(Faraday::TimeoutError)
      end

      specify { expect { subject.content }.to raise_error(EveOnline::Exceptions::TimeoutException) }
    end
  end

  describe '#response' do
    let(:parser) { double }

    let(:content) { 'some xml content to parse' }

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

require 'spec_helper'

describe EveOnline::XML::Base do
  describe '#initialize' do
    let(:parser) { double }

    before do
      #
      # Nori.new(advanced_typecasting: false) => double
      #
      expect(Nori).to receive(:new).with(advanced_typecasting: false).and_return(parser)
    end

    its(:parser) { should eq(parser) }
  end

  describe '#url' do
    specify { expect { subject.url }.to raise_error(NotImplementedError) }
  end

  describe '#user_agent' do
    specify { expect(subject.user_agent).to eq("EveOnline API (https://github.com/biow0lf/eve_online) v#{ EveOnline::VERSION }") }
  end

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

      specify { expect { subject.content }.not_to raise_error }

      specify { expect { subject.content }.to change { subject.instance_variable_defined?(:@_memoized_content) }.from(false).to(true) }
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
end

require 'spec_helper'

describe EveOnline::Base do
  specify { expect(described_class).to be_a(Memoist) }

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

      let(:client) { double }

      before do
        #
        # RestClient::Request.execute(method: :get,
        #                             url: url,
        #                             open_timeout: 60,
        #                             timeout: 60,
        #                             headers: { user_agent: user_agent }) => client
        #
        expect(RestClient::Request).to receive(:execute).with(method: :get,
                                                              url: url,
                                                              open_timeout: 60,
                                                              timeout: 60,
                                                              headers: { user_agent: user_agent }).and_return(client)
      end

      before { expect(client).to receive(:body) }

      specify { expect { subject.content }.not_to raise_error }

      specify { expect { subject.content }.to change { subject.instance_variable_defined?(:@_memoized_content) }.from(false).to(true) }
    end

    context 'exception' do
      let(:url) { double }

      before { expect(subject).to receive(:url).and_return(url) }

      let(:user_agent) { double }

      before { expect(subject).to receive(:user_agent).and_return(user_agent) }

      before do
        #
        # RestClient::Request.execute(method: :get,
        #                             url: url,
        #                             open_timeout: 60,
        #                             timeout: 60,
        #                             headers: { user_agent: user_agent }) => RestClient::Exceptions::Timeout
        #
        expect(RestClient::Request).to receive(:execute).with(method: :get,
                                                              url: url,
                                                              open_timeout: 60,
                                                              timeout: 60,
                                                              headers: { user_agent: user_agent }).and_raise(RestClient::Exceptions::Timeout)
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

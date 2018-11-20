# frozen_string_literal: true

require 'spec_helper'

describe EveOnline::ESI::ResponseWithEtag do
  describe '#response_with_etag' do
    let(:klass) do
      class A
        include EveOnline::ESI::ResponseWithEtag
      end
    end

    subject { klass.new }

    context 'when @response_with_etag not set' do
      let(:response) { double }

      let(:current_etag) { double }

      let(:response_with_etag) { double }

      before { expect(subject).to receive(:response).and_return(response) }

      before { expect(subject).to receive(:current_etag).and_return(current_etag) }

      before { expect(response).to receive(:merge).with(etag: current_etag).and_return(response_with_etag) }

      specify { expect { subject.response_with_etag }.not_to raise_error }

      specify { expect { subject.response_with_etag }.to change { subject.instance_variable_get(:@response_with_etag) }.from(nil).to(response_with_etag) }
    end

    context 'when @response_with_etag is set' do
      let(:response_with_etag) { double }

      before { subject.instance_variable_set(:@response_with_etag, response_with_etag) }

      specify { expect(subject.response_with_etag).to eq(response_with_etag) }
    end
  end
end

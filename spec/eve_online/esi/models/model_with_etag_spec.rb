# frozen_string_literal: true

require 'spec_helper'

describe EveOnline::ESI::Models::ModelWithEtag do
  describe '#etag' do
    let(:klass) do
      class A
        include EveOnline::ESI::Models::ModelWithEtag
      end
    end

    subject { klass.new }

    let(:options) { double }

    before { expect(subject).to receive(:options).and_return(options) }

    before { expect(options).to receive(:[]).with('etag') }

    specify { expect { subject.etag }.not_to raise_error }
  end
end

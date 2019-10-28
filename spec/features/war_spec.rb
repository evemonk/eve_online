# frozen_string_literal: true

require 'spec_helper'

describe 'Get war information' do
  context 'when etag not set' do
    let(:options) { { id: 654_019 } }

    before { VCR.insert_cassette 'esi/wars/654019' }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::War.new(options) }

    specify { expect(subject.scope).to eq(nil) }

    specify { expect(subject.not_modified?).to eq(false) }

    specify do
      expect(subject.as_json).to eq(declared: '2019-10-14 07:24:00.000000000 +0000',
                                    finished: '2019-10-23 11:42:00.000000000 +0000',
                                    mutual: false,
                                    open_for_allies: true,
                                    retracted: nil,
                                    started: '2019-10-15 07:24:00.000000000 +0000',
                                    war_id: 654_019)
    end

    specify { expect(subject.etag).to eq('01fa26aad0ed536a053e1e53656f299b2c0f66a09bbccc2be37950e8') }
  end

  context 'when etag is set' do
    let(:options) do
      {
        id: 654_019,
        etag: '01fa26aad0ed536a053e1e53656f299b2c0f66a09bbccc2be37950e8'
      }
    end

    before { VCR.insert_cassette 'esi/wars/654019_with_etag' }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::War.new(options) }

    specify { expect(subject.not_modified?).to eq(true) }

    specify { expect(subject.etag).to eq('01fa26aad0ed536a053e1e53656f299b2c0f66a09bbccc2be37950e8') }
  end
end

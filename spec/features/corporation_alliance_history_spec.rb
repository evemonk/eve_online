# frozen_string_literal: true

require 'spec_helper'

describe 'Get alliance history' do
  context 'when etag not set' do
    let(:options) { { corporation_id: 98_134_807 } }

    before { VCR.insert_cassette 'esi/corporation_alliance_history/98134807' }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::CorporationAllianceHistory.new(options) }

    specify { expect(subject.not_modified?).to eq(false) }

    specify { expect(subject.scope).to eq(nil) }

    specify { expect(subject.entries.size).to eq(12) }

    specify do
      expect(subject.entries.first.as_json).to eq(alliance_id: 99_005_874,
                                                  is_deleted: nil,
                                                  record_id: 1_254_640,
                                                  start_date: '2019-06-03T00:17:00Z')
    end

    specify { expect(subject.etag).to eq('9a949294cfa5fcef345ea8d89a574defa09be39845b9b97f1fdddd41') }
  end

  context 'when etag is set' do
    let(:options) do
      {
        corporation_id: 98_134_807,
        etag: '9a949294cfa5fcef345ea8d89a574defa09be39845b9b97f1fdddd41'
      }
    end

    before { VCR.insert_cassette 'esi/corporation_alliance_history/98134807_with_etag' }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::CorporationAllianceHistory.new(options) }

    specify { expect(subject.not_modified?).to eq(true) }

    specify { expect(subject.etag).to eq('9a949294cfa5fcef345ea8d89a574defa09be39845b9b97f1fdddd41') }
  end
end

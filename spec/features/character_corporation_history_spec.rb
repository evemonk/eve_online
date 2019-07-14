# frozen_string_literal: true

require 'spec_helper'

describe 'Get corporation history' do
  context 'when etag not set' do
    let(:options) { { character_id: 90_729_314 } }

    before { VCR.insert_cassette 'esi/character_corporation_history/90729314' }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::CharacterCorporationHistory.new(options) }

    specify { expect(subject.not_modified?).to eq(false) }

    specify { expect(subject.scope).to eq(nil) }

    specify { expect(subject.entries.size).to eq(1) }

    specify do
      expect(subject.entries.first.as_json).to eq(corporation_id: 1_000_168,
                                                  is_deleted: nil,
                                                  record_id: 16_785_803,
                                                  start_date: '2011-05-10T10:23:00Z')
    end

    specify { expect(subject.etag).to eq('f9497588fc2db18ca9a2ee06c48a16120e0c712fe9925bb29d7aaeeb') }
  end

  context 'when etag is set' do
    let(:options) do
      {
        character_id: 90_729_314,
        etag: 'f9497588fc2db18ca9a2ee06c48a16120e0c712fe9925bb29d7aaeeb'
      }
    end
 
    before { VCR.insert_cassette 'esi/character_corporation_history/90729314_with_etag' }
 
    after { VCR.eject_cassette }
 
    subject { EveOnline::ESI::CharacterCorporationHistory.new(options) }
 
    specify { expect(subject.not_modified?).to eq(true) }
 
    specify { expect(subject.etag).to eq('f9497588fc2db18ca9a2ee06c48a16120e0c712fe9925bb29d7aaeeb') }
  end
end

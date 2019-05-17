# frozen_string_literal: true

require 'spec_helper'

describe "Get character's public information" do
  context 'when etag not set' do
    let(:options) { { character_id: 1_337_512_245 } }

    before { VCR.insert_cassette 'esi/characters/1337512245' }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::Character.new(options) }

    specify { expect(subject.scope).to eq(nil) }

    specify { expect(subject.not_modified?).to eq(false) }

    specify do
      expect(subject.as_json).to eq(corporation_id: 98_134_807,
                                    birthday: '2010-01-15T15:26:00Z',
                                    name: 'Johnn Dillinger',
                                    gender: 'male',
                                    race_id: 2,
                                    bloodline_id: 4,
                                    description: '',
                                    alliance_id: 99_005_443,
                                    ancestry_id: 24,
                                    security_status: 1.8694881661345457,
                                    faction_id: nil,
                                    title: nil)
    end

    specify { expect(subject.etag).to eq('22c39689783a86032b8d43fa0b2e8f4809c4f38a585e39471035aa8b') }
  end

  context 'when etag is set' do
    let(:options) do
      {
        character_id: 1_337_512_245,
        etag: '22c39689783a86032b8d43fa0b2e8f4809c4f38a585e39471035aa8b'
      }
    end

    before { VCR.insert_cassette 'esi/characters/1337512245_with_etag' }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::Character.new(options) }

    specify { expect(subject.not_modified?).to eq(true) }

    specify { expect(subject.etag).to eq('22c39689783a86032b8d43fa0b2e8f4809c4f38a585e39471035aa8b') }
  end
end

# frozen_string_literal: true

require 'spec_helper'

describe 'Get character races' do
  context 'when etag not set' do
    before { VCR.insert_cassette 'esi/universe/races' }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::UniverseRaces.new }

    specify { expect(subject.not_modified?).to eq(false) }

    specify { expect(subject.scope).to eq(nil) }

    specify { expect(subject.races.size).to eq(4) }

    specify do
      expect(subject.races.first.as_json).to eq(alliance_id: 500_001,
                                                description: 'Founded on the tenets of patriotism and hard work that carried its ancestors through hardships on an inhospitable homeworld, the Caldari State is today a corporate dictatorship, led by rulers who are determined to see it return to the meritocratic ideals of old. Ruthless and efficient in the boardroom as well as on the battlefield, the Caldari are living emblems of strength, persistence, and dignity.',
                                                name: 'Caldari',
                                                race_id: 1)
    end

    specify { expect(subject.etag).to eq('e3f6a76b4a1287f54966c6253f8f5d6ac6460bc43d47570331b43e0b') }
  end

  context 'when etag is set' do
    before { VCR.insert_cassette 'esi/universe/races_with_etag' }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::UniverseRaces.new(etag: 'e3f6a76b4a1287f54966c6253f8f5d6ac6460bc43d47570331b43e0b') }

    specify { expect(subject.not_modified?).to eq(true) }

    specify { expect(subject.etag).to eq('e3f6a76b4a1287f54966c6253f8f5d6ac6460bc43d47570331b43e0b') }
  end
end

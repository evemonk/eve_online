# frozen_string_literal: true

require 'spec_helper'

describe 'Get planet information' do
  context 'when etag not set' do
    before { VCR.insert_cassette 'esi/universe/planets/40000002' }

    after { VCR.eject_cassette }

    let(:options) { { id: 40_000_002 } }

    subject { EveOnline::ESI::UniversePlanet.new(options) }

    specify { expect(subject.scope).to eq(nil) }

    specify do
      expect(subject.as_json).to eq(name: 'Tanoo I',
                                    planet_id: 40_000_002,
                                    system_id: 30_000_001,
                                    type_id: 11)
    end

    specify do
      expect(subject.position.as_json).to eq(x: 161_891_117_336.0,
                                             y: 21_288_951_986.0,
                                             z: -73_529_712_226.0)
    end

    specify { expect(subject.etag).to eq('e3f6a76b4a1287f54966c6253f8f5d6ac6460bc43d47570331b43e0b') }
  end

  context 'when etag is set' do
    let(:options) do
      {
        id: 40_000_002,
        etag: 'e3f6a76b4a1287f54966c6253f8f5d6ac6460bc43d47570331b43e0b'
      }
    end

    before { VCR.insert_cassette 'esi/universe/planets/40000002_with_etag' }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::UniversePlanet.new(options) }

    specify { expect(subject.not_modified?).to eq(true) }

    specify { expect(subject.etag).to eq('e3f6a76b4a1287f54966c6253f8f5d6ac6460bc43d47570331b43e0b') }
  end
end

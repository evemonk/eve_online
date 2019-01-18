# frozen_string_literal: true

require 'spec_helper'

describe 'Get asteroid belt information' do
  context 'when etag not set' do
    before { VCR.insert_cassette 'esi/universe/asteroid_belts/40000003' }

    after { VCR.eject_cassette }

    let(:options) { { id: 40_000_003 } }

    subject { EveOnline::ESI::UniverseAsteroidBelt.new(options) }

    specify { expect(subject.scope).to eq(nil) }

    specify { expect(subject.not_modified?).to eq(false) }

    specify do
      expect(subject.as_json).to eq(name: 'Tanoo I - Asteroid Belt 1',
                                    system_id: 30_000_001)
    end

    specify do
      expect(subject.position.as_json).to eq(x: 161_967_513_600.0,
                                             y: 21_288_837_120.0,
                                             z: -73_505_464_320.0)
    end

    specify { expect(subject.etag).to eq('5c9218218aca123ef8c106f6607bfe8e6e086d2fc2b972bbd8ff03d2') }
  end

  context 'when etag is set' do
    before { VCR.insert_cassette 'esi/universe/asteroid_belts/40000003_with_etag' }

    after { VCR.eject_cassette }

    let(:options) do
      {
        id: 40_000_003,
        etag: '5c9218218aca123ef8c106f6607bfe8e6e086d2fc2b972bbd8ff03d2'
      }
    end

    subject { EveOnline::ESI::UniverseAsteroidBelt.new(options) }

    specify { expect(subject.not_modified?).to eq(true) }

    specify { expect(subject.etag).to eq('5c9218218aca123ef8c106f6607bfe8e6e086d2fc2b972bbd8ff03d2') }
  end
end

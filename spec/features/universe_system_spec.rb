# frozen_string_literal: true

require "spec_helper"

describe "Get solar system information" do
  context "when etag not set" do
    before { VCR.insert_cassette "esi/universe/systems/30000001" }

    after { VCR.eject_cassette }

    let(:options) { {id: 30_000_001, language: "en-us"} }

    subject { EveOnline::ESI::UniverseSystem.new(options) }

    specify { expect(subject.scope).to eq(nil) }

    specify { expect(subject.not_modified?).to eq(false) }

    specify do
      expect(subject.as_json).to eq(constellation_id: 20_000_001,
                                    name: "Tanoo",
                                    security_class: "B",
                                    security_status: 0.8583240509033203,
                                    star_id: 40_000_001,
                                    system_id: 30_000_001)
    end

    specify do
      expect(subject.position.as_json).to eq(x: -88_510_792_599_980_580.0,
                                             y: 42_369_443_966_878_880.0,
                                             z: -44_513_525_346_479_660.0)
    end

    specify { expect(subject.planets.size).to eq(6) }

    specify { expect(subject.planets.first.as_json).to eq(planet_id: 40_000_002) }

    specify { expect(subject.stargate_ids).to eq([50_000_056, 50_000_057, 50_000_058]) }

    specify { expect(subject.station_ids).to eq([60_012_526, 60_014_437]) }

    specify { expect(subject.etag).to eq("37a39e7a5f5ecc07b19a3128c319f1198d035aee10052d0a21ccdd94") }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(5) }
  end

  context "when etag is set" do
    let(:options) do
      {
        id: 30_000_001,
        language: "en-us",
        etag: "37a39e7a5f5ecc07b19a3128c319f1198d035aee10052d0a21ccdd94"
      }
    end

    before { VCR.insert_cassette "esi/universe/systems/30000001_with_etag" }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::UniverseSystem.new(options) }

    specify { expect(subject.not_modified?).to eq(true) }

    specify { expect(subject.etag).to eq("37a39e7a5f5ecc07b19a3128c319f1198d035aee10052d0a21ccdd94") }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(53) }
  end
end

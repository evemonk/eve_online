# frozen_string_literal: true

require "spec_helper"

describe "Get factions" do
  context "when etag not set" do
    before { VCR.insert_cassette "esi/universe/factions" }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::UniverseFactions.new }

    specify { expect(subject.not_modified?).to eq(false) }

    specify { expect(subject.scope).to eq(nil) }

    specify { expect(subject.factions.size).to eq(24) }

    specify do
      expect(subject.factions.first.as_json).to eq(corporation_id: 1_000_035,
                                                   description: "The Caldari State is ruled by several mega-corporations. There is no central government to speak of - all territories within the State are owned and ruled by corporations. Duty and discipline are required traits in Caldari citizens, plus unquestioning loyalty to the corporation they live to serve. The corporations compete aggressively amongst themselves and with companies outside the State, resulting in a highly capitalistic society.",
                                                   faction_id: 500_001,
                                                   is_unique: true,
                                                   militia_corporation_id: 1_000_180,
                                                   name: "Caldari State",
                                                   size_factor: 5.0,
                                                   solar_system_id: 30_000_145,
                                                   station_count: 1503,
                                                   station_system_count: 503)
    end

    specify { expect(subject.etag).to eq("37a39e7a5f5ecc07b19a3128c319f1198d035aee10052d0a21ccdd94") }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(34) }
  end

  context "when etag is set" do
    before { VCR.insert_cassette "esi/universe/factions_with_etag" }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::UniverseFactions.new(etag: "37a39e7a5f5ecc07b19a3128c319f1198d035aee10052d0a21ccdd94") }

    specify { expect(subject.not_modified?).to eq(true) }

    specify { expect(subject.etag).to eq("37a39e7a5f5ecc07b19a3128c319f1198d035aee10052d0a21ccdd94") }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(34) }
  end
end

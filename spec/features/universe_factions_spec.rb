# frozen_string_literal: true

require "spec_helper"

describe "Get factions" do
  before { VCR.insert_cassette "esi/universe/factions" }

  after { VCR.eject_cassette }

  subject { EveOnline::ESI::UniverseFactions.new }

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

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(34) }
end

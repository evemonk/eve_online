# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get station information" do
  before { VCR.insert_cassette "esi/universe/stations/60012526" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.universe.station(id: 60_012_526) }

  specify do
    expect(subject.as_json).to eq(max_dockable_ship_volume: 50_000_000.0,
      name: "Tanoo V - Moon 1 - Ammatar Consulate Bureau",
      office_rental_cost: 471_035.0,
      owner: 1_000_126,
      race_id: 2,
      reprocessing_efficiency: 0.5,
      reprocessing_stations_take: 0.05,
      services: ["bounty-missions",
        "courier-missions",
        "interbus",
        "reprocessing-plant",
        "market",
        "stock-exchange",
        "cloning",
        "repair-facilities",
        "fitting",
        "news",
        "insurance",
        "docking",
        "office-rental",
        "loyalty-point-store",
        "navy-offices",
        "security-offices"],
      station_id: 60_012_526,
      system_id: 30_000_001,
      type_id: 2_502)
  end

  specify do
    expect(subject.position.as_json).to eq(x: -1_106_145_239_040.0,
      y: -145_460_060_160.0,
      z: 182_618_726_400.0)
  end

  specify { expect(subject.etag).to eq("W/\"913b3f4e2ed35371bed5a2ddb54a29f6451d6062f85c3490634a33b0\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("eee6aaf5-729f-4c04-ba73-7d7c42dbd776") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(36) }
end

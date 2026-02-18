# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get station information" do
  before { VCR.insert_cassette "esi/universe/stations/60012526" }

  after { VCR.eject_cassette }

  let(:options) { {id: 60_012_526} }

  subject { EveOnline::ESI::UniverseStation.new(options) }

  specify { expect(subject.scope).to eq(nil) }

  specify do
    expect(subject.as_json).to eq(max_dockable_ship_volume: 50_000_000.0,
      name: "Tanoo V - Moon 1 - Ammatar Consulate Bureau",
      office_rental_cost: 329_553.0,
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
      type_id: 2502)
  end

  specify do
    expect(subject.position.as_json).to eq(x: -1_106_145_239_040.0,
      y: -145_460_060_160.0,
      z: 182_618_726_400.0)
  end

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(36) }
end

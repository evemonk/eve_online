# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get incursions" do
  before { VCR.insert_cassette "esi/incursions/list" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.incursions.list }

  specify { expect(subject.size).to eq(5) }

  specify do
    expect(subject.first.as_json).to eq(constellation_id: 20_000_422,
      faction_id: 500_019,
      has_boss: false,
      infested_solar_systems: [30_002_880, 30_002_874, 30_002_875, 30_002_876, 30_002_877, 30_002_878, 30_002_879],
      influence: 0.0,
      staging_solar_system_id: 30_002_879,
      state: "established",
      type: "Incursion")
  end
end

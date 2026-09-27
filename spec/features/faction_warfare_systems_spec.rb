# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get faction warfare systems" do
  before { VCR.insert_cassette "esi/faction_warfare/systems" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.faction_warfare.systems }

  specify { expect(subject.size).to eq(160) }

  specify do
    expect(subject.first.as_json).to eq(contested: "uncontested",
      occupier_faction_id: 500_003,
      owner_faction_id: 500_003,
      solar_system_id: 30_002_957,
      victory_points: 0,
      victory_points_threshold: 75_000)
  end
end

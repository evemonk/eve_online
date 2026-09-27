# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get a single killmail" do
  before { VCR.insert_cassette "esi/killmails/121385936/aa7ef390212e3fd470924b0db8532c15710749e2" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject do
    client.killmails.retrieve(id: 121_385_936, hash: "aa7ef390212e3fd470924b0db8532c15710749e2")
  end

  specify do
    expect(subject.as_json).to eq(killmail_id: 121_385_936,
      killmail_time: Time.utc(2024, 10, 5, 5, 27, 8),
      moon_id: nil,
      solar_system_id: 30_001_363,
      war_id: 744_979)
  end

  specify { expect(subject.attackers.size).to eq(7) }

  specify do
    expect(subject.attackers.first.as_json).to eq(alliance_id: 99_013_481,
      character_id: 91_764_176,
      corporation_id: 98_585_301,
      damage_done: 4886,
      faction_id: nil,
      final_blow: false,
      security_status: -1.2,
      ship_type_id: 29986,
      weapon_type_id: 29986)
  end

  specify do
    expect(subject.victim.as_json).to eq(alliance_id: 741_557_221,
      character_id: 460_867_562,
      corporation_id: 1_551_757_800,
      damage_taken: 15_630,
      faction_id: nil,
      ship_type_id: 3756)
  end

  specify { expect(subject.victim.items.size).to eq(30) }

  specify do
    expect(subject.victim.position.as_json).to eq(x: 1_826_991_257_104.0034,
      y: -2_393_946_336_105.3154,
      z: -1_338_694_657_565.3975)
  end
end

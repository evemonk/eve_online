# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get sovereignty campaigns" do
  before { VCR.insert_cassette "esi/sovereignty/campaigns" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.sovereignty.campaigns }

  specify { expect(subject.size).to eq(6) }

  specify do
    expect(subject.first.as_json).to eq(attackers_score: 0.4,
      campaign_id: 112_209,
      constellation_id: 20_000_618,
      defender_id: 99_009_287,
      defender_score: 0.6,
      event_type: "ihub_defense",
      solar_system_id: 30_004_228,
      start_time: Time.utc(2026, 9, 28, 9, 46, 24),
      structure_id: 1_055_170_539_463)
  end

  specify { expect(subject.first.participants.size).to eq(0) }
end

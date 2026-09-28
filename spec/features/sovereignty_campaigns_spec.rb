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

  specify { expect(subject.etag).to eq("\"6b26b65881048d00336b8df23ad39108857d04e964301f9edb815222\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("255af0d7-bc41-4ff3-a053-b1d7cd980601") }

  specify { expect(subject.ratelimit_group).to eq("sovereignty") }

  specify { expect(subject.ratelimit_limit).to eq("600/15m") }

  specify { expect(subject.ratelimit_remaining).to eq(594) }

  specify { expect(subject.ratelimit_used).to eq(2) }

  specify { expect(subject.error_limit_remain).to eq(nil) }

  specify { expect(subject.error_limit_reset).to eq(nil) }
end

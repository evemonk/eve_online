# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get raidable skyhooks" do
  before { VCR.insert_cassette "esi/activities/skyhooks_raidable" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.activities.raidable_skyhooks }

  specify { expect(subject.skyhooks.size).to eq(166) }

  specify { expect(subject.skyhooks.first.as_json).to eq(planet_id: 40_281_991, solar_system_id: 30_004_455) }

  specify do
    expect(subject.skyhooks.first.theft_vulnerability.as_json).to eq(end: Time.utc(2026, 9, 27, 22, 35, 29),
      start: Time.utc(2026, 9, 27, 20, 35, 29))
  end

  specify { expect(subject.etag).to eq("W/\"3e1ee818122c2a604e983b9deed07ec04f7bcbac1ac6999624a01bea55025874\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq(nil) }

  specify { expect(subject.ratelimit_group).to eq("activity") }

  specify { expect(subject.ratelimit_limit).to eq("30/15m") }

  specify { expect(subject.ratelimit_remaining).to eq(26) }

  specify { expect(subject.ratelimit_used).to eq(2) }

  specify { expect(subject.error_limit_remain).to eq(nil) }

  specify { expect(subject.error_limit_reset).to eq(nil) }
end

# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Retrieve the uptime and player counts" do
  before { VCR.insert_cassette "esi/server_status/info" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.server_status.info }

  specify do
    expect(subject.as_json).to eq(players: 32_697,
      server_version: "3145366",
      start_time: Time.utc(2025, 12, 30, 11, 1, 58),
      vip: nil)
  end

  specify { expect(subject.etag).to eq('"e2e234441e20bc911efc3fa903ab4daf5aeca4e8d8caef23b7a3c898"') }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("aaedbec2-945b-4141-8a39-245b84a8a841") }

  specify { expect(subject.ratelimit_group).to eq("status") }

  specify { expect(subject.ratelimit_limit).to eq("600/15m") }

  specify { expect(subject.ratelimit_remaining).to eq(598) }

  specify { expect(subject.ratelimit_used).to eq(2) }

  specify { expect(subject.error_limit_remain).to eq(nil) }

  specify { expect(subject.error_limit_reset).to eq(nil) }
end

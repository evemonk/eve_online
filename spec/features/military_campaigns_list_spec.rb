# frozen_string_literal: true

require "spec_helper"

RSpec.describe "List military campaigns" do
  before { VCR.insert_cassette "esi/military_campaigns/list" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.military_campaigns.list }

  specify { expect(subject.campaigns.size).to eq(4) }

  specify do
    expect(subject.campaigns.first.as_json).to eq(finished: Time.utc(2026, 9, 16, 10, 24, 53, 154_000),
      id: "7519d7db-1e95-4d0e-bbbe-c47cd47de3c0",
      progress: 30,
      started: Time.utc(2026, 6, 9, 11, 0, 9, 69_000),
      state: "Completed")
  end

  specify { expect(subject.etag).to eq(nil) }

  specify { expect(subject.cache_status).to eq(nil) }

  specify { expect(subject.request_id).to eq(nil) }

  specify { expect(subject.ratelimit_group).to eq("military-campaign") }

  specify { expect(subject.ratelimit_limit).to eq("300/15m") }

  specify { expect(subject.ratelimit_remaining).to eq(288) }

  specify { expect(subject.ratelimit_used).to eq(2) }

  specify { expect(subject.error_limit_remain).to eq(nil) }

  specify { expect(subject.error_limit_reset).to eq(nil) }
end

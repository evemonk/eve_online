# frozen_string_literal: true

require "spec_helper"

RSpec.describe "List military campaign objectives" do
  before { VCR.insert_cassette "esi/military_campaigns/7519d7db-1e95-4d0e-bbbe-c47cd47de3c0/objectives" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.military_campaigns.objectives(id: "7519d7db-1e95-4d0e-bbbe-c47cd47de3c0", limit: 10) }

  specify { expect(subject.objectives.size).to eq(10) }

  specify do
    objective = subject.objectives.first

    expect(objective.as_json).to eq(finished: nil,
      id: "36fe563a-bc80-4c86-94a4-114358a8912b",
      last_modified: Time.utc(2026, 9, 27, 19, 20, 14, 400_000),
      progress: 6634,
      started: Time.utc(2026, 8, 20, 16, 0, 3, 61_000),
      state: "Active")
  end

  specify do
    expect(subject.objectives.first.participants.as_json).to eq(committed: 1078, contributors: 854, total: 1181)
  end

  specify { expect(subject.cursor).to be_a(EveOnline::ESI::Models::MilitaryCampaignObjectivesCursor) }

  specify { expect(subject.etag).to eq(nil) }

  specify { expect(subject.cache_status).to eq(nil) }

  specify { expect(subject.request_id).to eq(nil) }

  specify { expect(subject.ratelimit_group).to eq("military-campaign") }

  specify { expect(subject.ratelimit_limit).to eq("300/15m") }

  specify { expect(subject.ratelimit_remaining).to eq(284) }

  specify { expect(subject.ratelimit_used).to eq(2) }

  specify { expect(subject.error_limit_remain).to eq(nil) }

  specify { expect(subject.error_limit_reset).to eq(nil) }
end

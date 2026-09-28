# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get faction warfare leaderboards" do
  before { VCR.insert_cassette "esi/faction_warfare/leaderboards" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.faction_warfare.leaderboards }

  specify { expect(subject.kills.active_total.size).to eq(4) }

  specify { expect(subject.kills.active_total.first.as_json).to eq(amount: 1_587_711, faction_id: 500_004) }

  specify { expect(subject.victory_points.yesterday.first.as_json).to eq(amount: 199_713, faction_id: 500_003) }

  specify { expect(subject.etag).to eq("W/\"913b3f4e2ed35371bed5a2ddb54a29f6451d6062f85c3490634a33b0\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("29143d8c-818a-40de-a9b5-0db5ab1d188a") }

  specify { expect(subject.ratelimit_group).to eq("factional-warfare") }

  specify { expect(subject.ratelimit_limit).to eq("150/15m") }

  specify { expect(subject.ratelimit_remaining).to eq(136) }

  specify { expect(subject.ratelimit_used).to eq(2) }

  specify { expect(subject.error_limit_remain).to eq(nil) }

  specify { expect(subject.error_limit_reset).to eq(nil) }
end

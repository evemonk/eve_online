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

  specify { expect(subject.etag).to eq("\"191ebaa877db008cd22499a4960964fc8a5317cfeb9ddb614aebae53\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("0096d035-e013-401a-b727-dfa6f19c665e") }

  specify { expect(subject.ratelimit_group).to eq("factional-warfare") }

  specify { expect(subject.ratelimit_limit).to eq("150/15m") }

  specify { expect(subject.ratelimit_remaining).to eq(128) }

  specify { expect(subject.ratelimit_used).to eq(2) }

  specify { expect(subject.error_limit_remain).to eq(nil) }

  specify { expect(subject.error_limit_reset).to eq(nil) }
end

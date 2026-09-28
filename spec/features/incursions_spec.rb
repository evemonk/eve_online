# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get incursions" do
  before { VCR.insert_cassette "esi/incursions/list" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.incursions.list }

  specify { expect(subject.size).to eq(5) }

  specify do
    expect(subject.first.as_json).to eq(constellation_id: 20_000_422,
      faction_id: 500_019,
      has_boss: false,
      infested_solar_systems: [30_002_880, 30_002_874, 30_002_875, 30_002_876, 30_002_877, 30_002_878, 30_002_879],
      influence: 0.0,
      staging_solar_system_id: 30_002_879,
      state: "established",
      type: "Incursion")
  end

  specify { expect(subject.etag).to eq("\"4230f84e40a0259d3852144326bec422484244b496c674bcf18fd4d1\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("6cd994e3-7f52-4c05-8ee9-9c540ffcef5f") }

  specify { expect(subject.ratelimit_group).to eq("incursion") }

  specify { expect(subject.ratelimit_limit).to eq("150/15m") }

  specify { expect(subject.ratelimit_remaining).to eq(146) }

  specify { expect(subject.ratelimit_used).to eq(2) }

  specify { expect(subject.error_limit_remain).to eq(nil) }

  specify { expect(subject.error_limit_reset).to eq(nil) }
end

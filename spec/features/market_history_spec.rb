# frozen_string_literal: true

require "spec_helper"

RSpec.describe "List historical market statistics in a region" do
  before { VCR.insert_cassette "esi/market/10000002/history" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.market.history(region_id: 10_000_002, type_id: 34) }

  specify { expect(subject.size).to eq(422) }

  specify do
    expect(subject.last.as_json).to eq(average: 3.78,
      date: "2026-09-26",
      highest: 3.79,
      lowest: 3.77,
      order_count: 1600,
      volume: 5_159_488_498)
  end

  specify { expect(subject.etag).to eq("W/\"5fe60e03aa031801814c44ac4c96f82f9f573a98df36fe55683669ef\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("84f7d83d-936e-4344-9b35-ee3b955c57f7") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(14) }
end

# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get types in a region's market" do
  before { VCR.insert_cassette "esi/market/10000002/types" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.market.types(region_id: 10_000_002) }

  specify { expect(subject.type_ids.size).to eq(1000) }

  specify { expect(subject.type_ids.first).to eq(49_152) }

  specify { expect(subject.etag).to eq("\"fdc1f458d204ca2fe576ecb4eb1791cdd8766fa0829aa5bd95b4e3df\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("ee951c07-e96a-4da5-9514-d3c470c6144c") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(12) }
end

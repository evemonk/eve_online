# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get industry facilities" do
  before { VCR.insert_cassette "esi/industry/facilities" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.industry.facilities }

  specify { expect(subject.size).to eq(2321) }

  specify do
    expect(subject.first.as_json).to eq(facility_id: 60_006_400,
      owner_id: 1_000_065,
      region_id: 10_000_043,
      solar_system_id: 30_003_488,
      tax: nil,
      type_id: 1928)
  end

  specify { expect(subject.etag).to eq("\"76c284b2b1096523c3509a8707ba06487b6711a39e665775882217be\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("34c731ee-dd8c-4460-9dcf-ee8d5f7ab610") }

  specify { expect(subject.ratelimit_group).to eq("industry") }

  specify { expect(subject.ratelimit_limit).to eq("150/15m") }

  specify { expect(subject.ratelimit_remaining).to eq(144) }

  specify { expect(subject.ratelimit_used).to eq(2) }

  specify { expect(subject.error_limit_remain).to eq(nil) }

  specify { expect(subject.error_limit_reset).to eq(nil) }
end

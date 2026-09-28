# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get regions" do
  before { VCR.insert_cassette "esi/universe/regions" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.universe.regions }

  specify { expect(subject.region_ids.size).to eq(114) }

  specify { expect(subject.region_ids.first).to eq(10_000_001) }

  specify { expect(subject.etag).to eq("W/\"913b3f4e2ed35371bed5a2ddb54a29f6451d6062f85c3490634a33b0\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("9853a801-7519-4ced-87dd-f9881fd7f1da") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(37) }
end

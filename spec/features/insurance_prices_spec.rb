# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get insurance prices" do
  before { VCR.insert_cassette "esi/insurance/prices" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.insurance.prices }

  specify { expect(subject.size).to eq(569) }

  specify { expect(subject.first.as_json).to eq(type_id: 34_475) }

  specify { expect(subject.first.levels.size).to eq(6) }

  specify { expect(subject.first.levels.first.as_json).to eq(cost: 0.0, name: "Basic", payout: 0.0) }

  specify { expect(subject.etag).to eq("\"f0c36562d287f23f17f56fad0dc670330af4be659e9d298ff85156ca\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("8a01ee40-945e-47e5-9d2d-021fd37a3c12") }

  specify { expect(subject.ratelimit_group).to eq("insurance") }

  specify { expect(subject.ratelimit_limit).to eq("150/15m") }

  specify { expect(subject.ratelimit_remaining).to eq(146) }

  specify { expect(subject.ratelimit_used).to eq(2) }

  specify { expect(subject.error_limit_remain).to eq(nil) }

  specify { expect(subject.error_limit_reset).to eq(nil) }
end

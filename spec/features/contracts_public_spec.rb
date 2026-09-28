# frozen_string_literal: true

require "spec_helper"

RSpec.describe "List public contracts in a region" do
  before { VCR.insert_cassette "esi/contracts/public/10000002" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.contracts.public(region_id: 10_000_002) }

  specify { expect(subject.size).to eq(1000) }

  specify do
    expect(subject.first.as_json).to eq(buyout: nil,
      collateral: 0.0,
      contract_id: 235_554_523,
      date_expired: Time.utc(2026, 9, 27, 22, 7, 39),
      date_issued: Time.utc(2026, 8, 30, 22, 7, 39),
      days_to_complete: 0,
      end_location_id: 60_003_760,
      for_corporation: nil,
      issuer_corporation_id: 1_000_167,
      issuer_id: 96_249_938,
      price: 100_000_000.0,
      reward: 0.0,
      start_location_id: 60_003_760,
      title: "",
      type: "item_exchange",
      volume: 0.01)
  end

  specify { expect(subject.etag).to eq("\"275fac071d91e158f25d2b637d37dcc301e2033ff27efade868e2e1b\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("db2f0fda-199f-413b-b843-1b2ea3272945") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(39) }
end

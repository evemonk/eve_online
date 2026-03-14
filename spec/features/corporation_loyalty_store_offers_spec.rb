# frozen_string_literal: true

require "spec_helper"

RSpec.describe "List loyalty store offers" do
  before { VCR.insert_cassette "esi/corporations_loyalty_store_offers/1000035" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.loyalty.offers(id: 1_000_035) }

  specify { expect(subject.size).to eq(334) }

  specify do
    expect(subject.first.as_json).to eq(ak_cost: 0,
      isk_cost: 2_400_000,
      lp_cost: 2_400,
      offer_id: 3_584,
      quantity: 5_000,
      type_id: 23_047)
  end

  specify { expect(subject.first.offer_required_items.size).to eq(1) }

  specify do
    expect(subject.first.offer_required_items.first.as_json).to eq(quantity: 5_000,
      type_id: 234)
  end

  specify { expect(subject.etag).to eq("W/\"c40912e5115e3a15d7a426241dbc29967f047ffae6bbac677c3e0c50\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("8819bb91-5c04-449c-8b68-6359c28b0494") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(10) }
end

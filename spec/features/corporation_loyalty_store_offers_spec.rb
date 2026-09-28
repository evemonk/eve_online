# frozen_string_literal: true

require "spec_helper"

RSpec.describe "List loyalty store offers" do
  before { VCR.insert_cassette "esi/corporations_loyalty_store_offers/1000035" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.loyalty.offers(id: 1_000_035) }

  specify { expect(subject.size).to eq(310) }

  specify do
    expect(subject.first.as_json).to eq(ak_cost: 0,
      isk_cost: 5_500_000,
      lp_cost: 5_500,
      offer_id: 3_587,
      quantity: 5_000,
      type_id: 27_339)
  end

  specify { expect(subject.first.offer_required_items.size).to eq(1) }

  specify do
    expect(subject.first.offer_required_items.first.as_json).to eq(quantity: 5_000,
      type_id: 2_506)
  end

  specify { expect(subject.etag).to eq("W/\"913b3f4e2ed35371bed5a2ddb54a29f6451d6062f85c3490634a33b0\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("078b249e-213e-49ce-8e66-31395e184f6d") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(44) }
end

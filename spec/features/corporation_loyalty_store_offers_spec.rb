# frozen_string_literal: true

require "spec_helper"

describe "List loyalty store offers" do
  let(:options) { {corporation_id: 1_000_035} }

  before { VCR.insert_cassette "esi/corporations_loyalty_store_offers/1000035" }

  after { VCR.eject_cassette }

  subject { EveOnline::ESI::CorporationLoyaltyStoreOffers.new(options) }

  specify { expect(subject.scope).to eq(nil) }

  specify { expect(subject.roles).to eq([]) }

  specify { expect(subject.offers.size).to eq(332) }

  specify do
    expect(subject.offers.first.as_json).to eq(ak_cost: nil,
      isk_cost: 2_400_000,
      lp_cost: 2_400,
      offer_id: 3_584,
      quantity: 5_000,
      type_id: 23_047)
  end

  specify { expect(subject.offers.first.offer_required_items.size).to eq(1) }

  specify do
    expect(subject.offers.first.offer_required_items.first.as_json).to eq(quantity: 5_000,
      type_id: 234)
  end

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(28) }
end

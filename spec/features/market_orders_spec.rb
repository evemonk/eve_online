# frozen_string_literal: true

require "spec_helper"

RSpec.describe "List orders in a region" do
  before { VCR.insert_cassette "esi/market/10000002/orders" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.market.orders(region_id: 10_000_002, order_type: "sell", type_id: 34) }

  specify { expect(subject.size).to eq(99) }

  specify do
    expect(subject.first.as_json).to eq(duration: 90,
      is_buy_order: false,
      issued: Time.utc(2026, 9, 16, 8, 41, 39),
      location_id: 60_005_458,
      min_volume: 1,
      order_id: 7_423_712_969,
      price: 4.0,
      range: "region",
      system_id: 30_000_128,
      type_id: 34,
      volume_remain: 8_860_466,
      volume_total: 8_860_537)
  end
end

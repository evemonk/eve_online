# frozen_string_literal: true

require "spec_helper"

describe "List market prices" do
  before { VCR.insert_cassette "esi/market/prices" }

  after { VCR.eject_cassette }

  subject { EveOnline::ESI::MarketPrices.new }

  specify { expect(subject.scope).to eq(nil) }

  specify { expect(subject.market_prices.size).to eq(12565) }

  specify do
    expect(subject.market_prices.first.as_json).to eq(adjusted_price: 923_296.88,
      average_price: 1_273_871.6,
      type_id: 32_772)
  end

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(16) }
end

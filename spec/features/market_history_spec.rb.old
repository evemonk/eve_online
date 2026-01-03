# frozen_string_literal: true

require "spec_helper"

describe "List historical market statistics in a region" do
  before { VCR.insert_cassette "esi/market/history" }

  after { VCR.eject_cassette }

  let(:options) { {region_id: 10_000_002, type_id: 28_606} }

  subject { EveOnline::ESI::MarketHistory.new(options) }

  specify { expect(subject.scope).to eq(nil) }

  specify { expect(subject.history.size).to eq(412) }

  specify do
    expect(subject.history.first.as_json).to eq(average: 745_052_179.61,
      date: "2017-12-01",
      highest: 758_999_988.59,
      lowest: 710_123_189.93,
      order_count: 37,
      volume: 37)
  end

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(34) }
end

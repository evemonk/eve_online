# frozen_string_literal: true

require "spec_helper"

describe "List historical market statistics in a region" do
  context "when etag not set" do
    before { VCR.insert_cassette "esi/market/history" }

    after { VCR.eject_cassette }

    let(:options) { {region_id: 10_000_002, type_id: 28_606} }

    subject { EveOnline::ESI::MarketHistory.new(options) }

    specify { expect(subject.scope).to eq(nil) }

    specify { expect(subject.not_modified?).to eq(false) }

    specify { expect(subject.history.size).to eq(412) }

    specify do
      expect(subject.history.first.as_json).to eq(average: 745_052_179.61,
                                                  date: "2017-12-01",
                                                  highest: 758_999_988.59,
                                                  lowest: 710_123_189.93,
                                                  order_count: 37,
                                                  volume: 37)
    end

    specify { expect(subject.etag).to eq("01636947a53db63a0369aab78bbc98bae94a49cd6aa3950c29d588ae") }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(34) }
  end

  context "when etag is set" do
    before { VCR.insert_cassette "esi/market/history_with_etag" }

    after { VCR.eject_cassette }

    let(:options) do
      {
        region_id: 10_000_002,
        type_id: 28_606,
        etag: "01636947a53db63a0369aab78bbc98bae94a49cd6aa3950c29d588ae"
      }
    end

    subject { EveOnline::ESI::MarketHistory.new(options) }

    specify { expect(subject.not_modified?).to eq(true) }

    specify { expect(subject.etag).to eq("01636947a53db63a0369aab78bbc98bae94a49cd6aa3950c29d588ae") }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(26) }
  end
end

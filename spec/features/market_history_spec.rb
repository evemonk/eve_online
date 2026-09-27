# frozen_string_literal: true

require "spec_helper"

RSpec.describe "List historical market statistics in a region" do
  before { VCR.insert_cassette "esi/market/10000002/history" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.market.history(region_id: 10_000_002, type_id: 34) }

  specify { expect(subject.size).to eq(422) }

  specify do
    expect(subject.last.as_json).to eq(average: 3.78,
      date: "2026-09-26",
      highest: 3.79,
      lowest: 3.77,
      order_count: 1600,
      volume: 5_159_488_498)
  end
end

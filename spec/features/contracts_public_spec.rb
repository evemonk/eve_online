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
end

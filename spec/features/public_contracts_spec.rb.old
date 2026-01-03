# frozen_string_literal: true

require "spec_helper"

describe "Get public contracts" do
  before { VCR.insert_cassette "esi/public_contracts" }

  after { VCR.eject_cassette }

  let(:options) { {region_id: 10_000_043, page: 1} }

  subject { EveOnline::ESI::PublicContracts.new(options) }

  specify { expect(subject.scope).to eq(nil) }

  specify { expect(subject.page).to eq(1) }

  specify { expect(subject.total_pages).to eq(4) }

  specify { expect(subject.contracts.size).to eq(1000) }

  specify do
    expect(subject.contracts.first.as_json).to eq(buyout: nil,
      collateral: 0.0,
      contract_id: 157_834_735,
      date_expired: "2020-06-17T21:36:41Z",
      date_issued: "2020-05-20T21:36:41Z",
      days_to_complete: 0,
      end_location_id: 60_008_494,
      for_corporation: true,
      issuer_corporation_id: 897_372_069,
      issuer_id: 1_314_102_096,
      price: 1_250_000_000.0,
      reward: 0.0,
      start_location_id: 60_008_494,
      title: "Apostle Me10/Te16 Complete Bpc 10 Pack",
      kind: "item_exchange",
      volume: 100.0)
  end

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(7) }
end

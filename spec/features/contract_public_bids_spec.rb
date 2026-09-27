# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get public contract bids" do
  before { VCR.insert_cassette "esi/contracts/public/bids/236027965" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.contracts.public_bids(contract_id: 236_027_965) }

  specify { expect(subject.size).to eq(1) }

  specify do
    expect(subject.first.as_json).to eq(amount: 15_000_000.0,
      bid_id: 6_672_150,
      date_bid: Time.utc(2026, 9, 23, 8, 11, 31))
  end
end

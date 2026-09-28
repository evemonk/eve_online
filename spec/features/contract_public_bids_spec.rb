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

  specify { expect(subject.etag).to eq("\"8189de763791a6d198a102f08124b25467ddbdd3317be99b40b62454\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("316b08fc-cbb8-4666-9e4e-2de33ee7cd67") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(41) }
end

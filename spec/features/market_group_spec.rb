# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get item group information" do
  before { VCR.insert_cassette "esi/market/groups/5" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.market.group(id: 5) }

  specify do
    expect(subject.as_json).to eq(description: "Small, fast vessels suited to a variety of purposes.",
      market_group_id: 5,
      name: "Standard Frigates",
      parent_group_id: 1361,
      types: [])
  end

  specify { expect(subject.etag).to eq("W/\"913b3f4e2ed35371bed5a2ddb54a29f6451d6062f85c3490634a33b0\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("c9979586-579f-4ae2-8c1b-773ac94cbb51") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(17) }
end

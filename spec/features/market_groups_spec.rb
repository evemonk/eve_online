# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get item groups" do
  before { VCR.insert_cassette "esi/market/groups" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.market.groups }

  specify { expect(subject.market_group_ids.size).to eq(2114) }

  specify { expect(subject.market_group_ids.first(3)).to eq([2, 4, 5]) }

  specify { expect(subject.etag).to eq("W/\"913b3f4e2ed35371bed5a2ddb54a29f6451d6062f85c3490634a33b0\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("95eb2e23-4c87-4954-a890-827f7d71882f") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(18) }
end

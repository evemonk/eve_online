# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get item groups" do
  before { VCR.insert_cassette "esi/universe/groups" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.universe.groups(page: 1) }

  specify { expect(subject.total_pages).to eq(2) }

  specify { expect(subject.group_ids.size).to eq(1000) }

  specify { expect(subject.group_ids.first).to eq(0) }

  specify { expect(subject.etag).to eq("W/\"913b3f4e2ed35371bed5a2ddb54a29f6451d6062f85c3490634a33b0\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("b73be8ba-760d-4824-a8c2-98aab3e5f493") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(38) }
end

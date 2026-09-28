# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get item category information" do
  before { VCR.insert_cassette "esi/universe/categories/6" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.universe.category(id: 6) }

  specify do
    expect(subject.as_json).to eq(category_id: 6,
      name: "Ship",
      published: true)
  end

  specify { expect(subject.group_ids.size).to eq(50) }

  specify { expect(subject.group_ids.first).to eq(25) }

  specify { expect(subject.etag).to eq("W/\"913b3f4e2ed35371bed5a2ddb54a29f6451d6062f85c3490634a33b0\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("9eb5081a-f397-448c-9be0-5d3499d05463") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(40) }
end

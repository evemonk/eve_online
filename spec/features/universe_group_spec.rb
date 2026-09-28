# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get item group information" do
  before { VCR.insert_cassette "esi/universe/groups/450" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.universe.group(id: 450) }

  specify do
    expect(subject.as_json).to eq(category_id: 25,
      group_id: 450,
      name: "Arkonor",
      published: true)
  end

  specify { expect(subject.type_ids.size).to eq(14) }

  specify { expect(subject.type_ids.first).to eq(22) }

  specify { expect(subject.etag).to eq("W/\"913b3f4e2ed35371bed5a2ddb54a29f6451d6062f85c3490634a33b0\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("5f222b4f-c9cf-4e80-8160-fe4823544280") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(38) }
end

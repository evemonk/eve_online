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

  specify { expect(subject.etag).to eq("W/\"eb02b32cba3ed2b28639d4d552243949671a18d2b8aca54f4271cfbb\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("d6a53435-7ac4-4c08-b845-178f29ead84d") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(21) }
end

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

  specify { expect(subject.group_ids.size).to eq(48) }

  specify { expect(subject.group_ids.first).to eq(25) }

  specify { expect(subject.etag).to eq("W/\"eb02b32cba3ed2b28639d4d552243949671a18d2b8aca54f4271cfbb\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("20665add-7e7d-4e58-854b-03ca0c2a64b7") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(33) }
end

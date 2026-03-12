# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get item categories" do
  before { VCR.insert_cassette "esi/universe/categories" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.universe.categories }

  specify { expect(subject.category_ids.size).to eq(48) }

  specify { expect(subject.category_ids.first).to eq(0) }

  specify { expect(subject.etag).to eq("W/\"eb02b32cba3ed2b28639d4d552243949671a18d2b8aca54f4271cfbb\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("3b2de332-7214-424c-8cf4-9dbf6d154fa3") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(17) }
end

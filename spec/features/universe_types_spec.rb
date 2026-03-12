# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get types" do
  before { VCR.insert_cassette "esi/universe/types" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.universe.types }

  specify { expect(subject.total_pages).to eq(52) }

  specify { expect(subject.universe_type_ids.size).to eq(1000) }

  specify { expect(subject.universe_type_ids.first).to eq(0) }

  specify { expect(subject.etag).to eq("W/\"eb02b32cba3ed2b28639d4d552243949671a18d2b8aca54f4271cfbb\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("f5830882-1403-48e4-9a49-66c26dcd1ac9") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(6) }
end

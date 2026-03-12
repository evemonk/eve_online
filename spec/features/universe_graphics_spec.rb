# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get graphics" do
  before { VCR.insert_cassette "esi/universe/graphics" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.universe.graphics }

  specify { expect(subject.graphic_ids.size).to eq(5_994) }

  specify { expect(subject.graphic_ids.first).to eq(10) }

  specify { expect(subject.etag).to eq("W/\"eb02b32cba3ed2b28639d4d552243949671a18d2b8aca54f4271cfbb\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("887ea8ec-a760-403b-b590-527a29e5a0db") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(2) }
end

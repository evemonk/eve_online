# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get graphics" do
  before { VCR.insert_cassette "esi/universe/graphics" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.universe.graphics }

  specify { expect(subject.graphic_ids.size).to eq(6_156) }

  specify { expect(subject.graphic_ids.first).to eq(24624) }

  specify { expect(subject.etag).to eq("W/\"913b3f4e2ed35371bed5a2ddb54a29f6451d6062f85c3490634a33b0\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("6fcd7cba-125c-4f24-918c-45d269a979d4") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(39) }
end

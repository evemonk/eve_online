# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get effects" do
  before { VCR.insert_cassette "esi/dogma/effects" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.dogma.effects }

  specify { expect(subject.effect_ids.size).to eq(3_356) }

  specify { expect(subject.effect_ids.first).to eq(3_356) }

  specify { expect(subject.etag).to eq("W/\"eb02b32cba3ed2b28639d4d552243949671a18d2b8aca54f4271cfbb\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("1f7f6c41-edec-4d5a-9a11-7fcdab9d8c59") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(3) }
end

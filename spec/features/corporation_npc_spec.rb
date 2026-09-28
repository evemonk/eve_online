# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get npc corporations" do
  before { VCR.insert_cassette "esi/corporation_npc" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.corporations.npc }

  specify { expect(subject.corporation_ids.size).to eq(283) }

  specify { expect(subject.corporation_ids.first).to eq(1_000_106) }

  specify { expect(subject.etag).to eq("W/\"913b3f4e2ed35371bed5a2ddb54a29f6451d6062f85c3490634a33b0\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("0a93aafd-e711-4974-9d0b-fce5aab839a7") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(45) }
end

# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get npc corporations" do
  before { VCR.insert_cassette "esi/corporation_npc" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.corporations.npc }

  specify { expect(subject.corporation_ids.size).to eq(283) }

  specify { expect(subject.corporation_ids.first).to eq(1_000_106) }

  specify { expect(subject.etag).to eq("W/\"f805136f9e57482fc672e0576b814b5bcd90c8e7122d9526e95b35ce\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("95a8f578-e122-4f04-a010-b032dfe06048") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(5) }
end

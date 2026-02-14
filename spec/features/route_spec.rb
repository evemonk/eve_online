# frozen_string_literal: true

require "spec_helper"

describe "Get route between two systems" do
  before { VCR.insert_cassette "esi/routes" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  let(:jita_system_id) { 30_000_142 }

  let(:amarr_system_id) { 30_002_187 }

  subject { client.routes.route(destination_system_id: amarr_system_id, origin_system_id: jita_system_id) }

  specify { expect(subject).to eq([]) }

  specify { expect(subject.etag).to eq("W/\"d53e06315fe6f15f4dd47da86f16b3cb51977abc22701227d931f03b\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("4cd7fc66-7920-414a-a2fe-a503582ad0d8") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(44) }
end

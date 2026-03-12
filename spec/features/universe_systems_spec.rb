# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get solar systems" do
  before { VCR.insert_cassette "esi/universe/systems" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.universe.systems }

  specify { expect(subject.system_ids.size).to eq(8_490) }

  specify { expect(subject.system_ids.first).to eq(30_000_001) }

  specify { expect(subject.etag).to eq("W/\"f801dec473fd1f6bae55b0287b44fc2022da563f59ea428eba3b2a2f\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("adbcc2b2-d57c-44d3-b263-4e1e63e20251") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(24) }
end

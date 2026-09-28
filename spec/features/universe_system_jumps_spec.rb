# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get system jumps" do
  before { VCR.insert_cassette "esi/universe/system_jumps" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.universe.system_jumps }

  specify { expect(subject.size).to eq(4930) }

  specify { expect(subject.first.as_json).to eq(ship_jumps: 90, system_id: 30_003_374) }

  specify { expect(subject.etag).to eq("\"8b8f3f7d0a21e008006c652d61929ba1806b6ba24debe9e069d2de80\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("4cd8549f-7117-49d2-b250-41a944c8bbe1") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(4) }
end

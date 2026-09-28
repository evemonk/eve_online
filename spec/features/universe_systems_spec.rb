# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get solar systems" do
  before { VCR.insert_cassette "esi/universe/systems" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.universe.systems }

  specify { expect(subject.system_ids.size).to eq(8_490) }

  specify { expect(subject.system_ids.first).to eq(30_000_001) }

  specify { expect(subject.etag).to eq("W/\"913b3f4e2ed35371bed5a2ddb54a29f6451d6062f85c3490634a33b0\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("84227952-29d4-4f3c-8fc8-842583db658b") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(35) }
end

# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get sovereignty systems" do
  before { VCR.insert_cassette "esi/sovereignty/systems" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.sovereignty.systems }

  specify { expect(subject.solar_systems.size).to eq(5485) }

  specify do
    expect(subject.solar_systems.first.as_json).to eq(claim: {"faction" => {"faction_id" => 500_007}},
      solar_system_id: 30_000_001)
  end

  specify { expect(subject.etag).to eq("W/\"a2cac5f2e35e3a659450ca7dd77f07526760041064428d80ec5fc1e1c0e106a3\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq(nil) }

  specify { expect(subject.ratelimit_group).to eq("sovereignty") }

  specify { expect(subject.ratelimit_limit).to eq("600/15m") }

  specify { expect(subject.ratelimit_remaining).to eq(592) }

  specify { expect(subject.ratelimit_used).to eq(2) }

  specify { expect(subject.error_limit_remain).to eq(nil) }

  specify { expect(subject.error_limit_reset).to eq(nil) }
end

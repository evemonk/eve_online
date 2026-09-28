# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get stargate information" do
  before { VCR.insert_cassette "esi/universe/stargates/50000056" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.universe.stargate(id: 50_000_056) }

  specify do
    expect(subject.as_json).to eq(name: "Stargate (Akpivem)",
      stargate_id: 50_000_056,
      system_id: 30_000_001,
      type_id: 29_624)
  end

  specify do
    expect(subject.position.as_json).to eq(
      x: 331_516_354_560.0,
      y: 43_597_455_360.0,
      z: -586_353_991_680.0
    )
  end

  specify do
    expect(subject.destination.as_json).to eq(
      stargate_id: 50_000_342,
      system_id: 30_000_003
    )
  end

  specify { expect(subject.etag).to eq("W/\"913b3f4e2ed35371bed5a2ddb54a29f6451d6062f85c3490634a33b0\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("3fa7fb44-2e05-4341-aece-20a13b4576d6") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(36) }
end

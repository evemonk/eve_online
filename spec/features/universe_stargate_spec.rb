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

  specify { expect(subject.etag).to eq("W/\"eb02b32cba3ed2b28639d4d552243949671a18d2b8aca54f4271cfbb\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("7b74e2bd-1406-4c7f-9cb3-25bd8377f269") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(2) }
end

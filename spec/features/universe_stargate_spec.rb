# frozen_string_literal: true

require "spec_helper"

describe "Get stargate information" do
  before { VCR.insert_cassette "esi/universe/stargates/50000056" }

  after { VCR.eject_cassette }

  let(:options) { {id: 50_000_056} }

  subject { EveOnline::ESI::UniverseStargate.new(options) }

  specify { expect(subject.scope).to eq(nil) }

  specify do
    expect(subject.as_json).to eq(name: "Stargate (Akpivem)",
      stargate_id: 50_000_056,
      system_id: 30_000_001,
      type_id: 29_624,
      destination_stargate_id: 50_000_342,
      destination_system_id: 30_000_003)
  end

  specify do
    expect(subject.position.as_json).to eq(x: 331_516_354_560.0,
      y: 43_597_455_360.0,
      z: -586_353_991_680.0)
  end

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(36) }
end

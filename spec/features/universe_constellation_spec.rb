# frozen_string_literal: true

require "spec_helper"

describe "Get constellation information" do
  before { VCR.insert_cassette "esi/universe/constellations/20000001" }

  after { VCR.eject_cassette }

  let(:options) { {id: 20_000_001} }

  subject { EveOnline::ESI::UniverseConstellation.new(options) }

  specify { expect(subject.scope).to eq(nil) }

  specify do
    expect(subject.as_json).to eq(constellation_id: 20_000_001,
      name: "San Matar",
      region_id: 10_000_001)
  end

  specify do
    expect(subject.position.as_json).to eq(x: -94_046_559_700_991_340.0,
      y: 49_520_153_153_798_850.0,
      z: -42_738_731_818_401_970.0)
  end

  specify do
    expect(subject.system_ids).to eq([30_000_001,
      30_000_002,
      30_000_003,
      30_000_004,
      30_000_005,
      30_000_006,
      30_000_007,
      30_000_008])
  end

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(32) }
end

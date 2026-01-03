# frozen_string_literal: true

require "spec_helper"

describe "Get asteroid belt information" do
  before { VCR.insert_cassette "esi/universe/asteroid_belts/40000003" }

  after { VCR.eject_cassette }

  let(:options) { {id: 40_000_003} }

  subject { EveOnline::ESI::UniverseAsteroidBelt.new(options) }

  specify { expect(subject.scope).to eq(nil) }

  specify do
    expect(subject.as_json).to eq(name: "Tanoo I - Asteroid Belt 1",
      system_id: 30_000_001)
  end

  specify do
    expect(subject.position.as_json).to eq(x: 161_967_513_600.0,
      y: 21_288_837_120.0,
      z: -73_505_464_320.0)
  end

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(50) }
end

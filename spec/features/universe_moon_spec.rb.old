# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get moon information" do
  before { VCR.insert_cassette "esi/universe/moons/40000004" }

  after { VCR.eject_cassette }

  let(:options) { {id: 40_000_004} }

  subject { EveOnline::ESI::UniverseMoon.new(options) }

  specify { expect(subject.scope).to eq(nil) }

  specify do
    expect(subject.as_json).to eq(moon_id: 40_000_004,
      name: "Tanoo I - Moon 1",
      system_id: 30_000_001)
  end

  specify do
    expect(subject.position.as_json).to eq(x: 162_088_094_286.0,
      y: 21_314_854_783.0,
      z: -73_598_621_491.0)
  end

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(59) }
end

# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get star information" do
  before { VCR.insert_cassette "esi/universe/stars/40000001" }

  after { VCR.eject_cassette }

  let(:options) { {id: 40_000_001} }

  subject { EveOnline::ESI::UniverseStar.new(options) }

  specify { expect(subject.scope).to eq(nil) }

  specify do
    expect(subject.as_json).to eq(age: 14_262_808_228,
      luminosity: 0.01575000025331974,
      name: "Tanoo - Star",
      radius: 126_700_000,
      solar_system_id: 30_000_001,
      spectral_class: "K2 V",
      temperature: 4567,
      type_id: 45_041)
  end

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(32) }
end

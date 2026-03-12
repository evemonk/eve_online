# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get star information" do
  before { VCR.insert_cassette "esi/universe/stars/40000001" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.universe.star(id: 40_000_001) }

  specify do
    expect(subject.as_json).to eq(
      age: 14_262_808_228,
      luminosity: 0.01575000025331974,
      name: "Tanoo - Star",
      radius: 63_350_000,
      solar_system_id: 30_000_001,
      spectral_class: "K2 V",
      temperature: 4567,
      type_id: 45_041)
  end

  specify { expect(subject.etag).to eq("W/\"eb02b32cba3ed2b28639d4d552243949671a18d2b8aca54f4271cfbb\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("560257e5-5235-499c-9731-802f192b336d") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(2) }
end

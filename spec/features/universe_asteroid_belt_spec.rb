# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get asteroid belt information" do
  before { VCR.insert_cassette "esi/universe/asteroid_belts/40000003" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.universe.asteroid_belt(id: 40_000_003) }

  specify do
    expect(subject.as_json).to eq(name: "Tanoo I - Asteroid Belt 1",
      system_id: 30_000_001)
  end

  specify do
    expect(subject.position.as_json).to eq(x: 161_967_513_600.0,
      y: 21_288_837_120.0,
      z: -73_505_464_320.0)
  end

  specify { expect(subject.etag).to eq("W/\"eb02b32cba3ed2b28639d4d552243949671a18d2b8aca54f4271cfbb\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("a965340c-76a4-4c35-b3aa-50ba1870871d") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(58) }
end

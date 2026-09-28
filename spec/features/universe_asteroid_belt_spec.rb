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

  specify { expect(subject.etag).to eq("\"913b3f4e2ed35371bed5a2ddb54a29f6451d6062f85c3490634a33b0\"") }

  specify { expect(subject.cache_status).to eq("MISS") }

  specify { expect(subject.request_id).to eq("4a880bd6-50ce-4ebb-9413-227a695d1c85") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(41) }
end

# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get moon information" do
  before { VCR.insert_cassette "esi/universe/moons/40000004" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.universe.moon(id: 40_000_004) }

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

  specify { expect(subject.etag).to eq("W/\"913b3f4e2ed35371bed5a2ddb54a29f6451d6062f85c3490634a33b0\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("5773e197-6619-4da2-962f-21cf05123ff5") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(38) }
end

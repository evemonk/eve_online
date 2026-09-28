# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get planet information" do
  before { VCR.insert_cassette "esi/universe/planets/40000002" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.universe.planet(id: 40_000_002) }

  specify do
    expect(subject.as_json).to eq(name: "Tanoo I",
      planet_id: 40_000_002,
      system_id: 30_000_001,
      type_id: 11)
  end

  specify do
    expect(subject.position.as_json).to eq(x: 161_891_117_336.0,
      y: 21_288_951_986.0,
      z: -73_529_712_226.0)
  end

  specify { expect(subject.etag).to eq("\"913b3f4e2ed35371bed5a2ddb54a29f6451d6062f85c3490634a33b0\"") }

  specify { expect(subject.cache_status).to eq("MISS") }

  specify { expect(subject.request_id).to eq("8edc8ded-2ba5-4c54-b6f4-1632563842be") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(37) }
end

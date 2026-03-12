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

  specify { expect(subject.etag).to eq("W/\"eb02b32cba3ed2b28639d4d552243949671a18d2b8aca54f4271cfbb\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("4bbfadde-a0ae-4129-8faa-2309fa71cd16") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(33) }
end

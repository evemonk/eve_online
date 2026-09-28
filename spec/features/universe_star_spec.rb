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
      type_id: 45_041
    )
  end

  specify { expect(subject.etag).to eq("\"913b3f4e2ed35371bed5a2ddb54a29f6451d6062f85c3490634a33b0\"") }

  specify { expect(subject.cache_status).to eq("MISS") }

  specify { expect(subject.request_id).to eq("faa3924a-251f-4ab8-87d1-e6382e668443") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(36) }
end

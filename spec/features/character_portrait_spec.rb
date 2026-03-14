# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get character portraits" do
  before { VCR.insert_cassette "esi/character_portraits/1337512245" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.characters.portraits(id: 1_337_512_245) }

  specify do
    expect(subject.as_json).to eq(huge: "https://images.evetech.net/characters/1337512245/portrait?tenant=tranquility&size=512",
      large: "https://images.evetech.net/characters/1337512245/portrait?tenant=tranquility&size=256",
      medium: "https://images.evetech.net/characters/1337512245/portrait?tenant=tranquility&size=128",
      small: "https://images.evetech.net/characters/1337512245/portrait?tenant=tranquility&size=64")
  end

  specify { expect(subject.etag).to eq("W/\"c40912e5115e3a15d7a426241dbc29967f047ffae6bbac677c3e0c50\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("ede0e3cf-d9c6-4c2e-adde-23adaaae581c") }

  specify { expect(subject.ratelimit_group).to eq("char-detail") }

  specify { expect(subject.ratelimit_limit).to eq("600/15m") }

  specify { expect(subject.ratelimit_remaining).to eq(598) }

  specify { expect(subject.ratelimit_used).to eq(2) }

  specify { expect(subject.error_limit_remain).to eq(nil) }

  specify { expect(subject.error_limit_reset).to eq(nil) }
end

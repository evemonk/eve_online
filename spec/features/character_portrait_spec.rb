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

  specify { expect(subject.huge).to eq("https://images.evetech.net/characters/1337512245/portrait?tenant=tranquility&size=512") }

  specify { expect(subject.large).to eq("https://images.evetech.net/characters/1337512245/portrait?tenant=tranquility&size=256") }

  specify { expect(subject.medium).to eq("https://images.evetech.net/characters/1337512245/portrait?tenant=tranquility&size=128") }

  specify { expect(subject.small).to eq("https://images.evetech.net/characters/1337512245/portrait?tenant=tranquility&size=64") }

  specify { expect(subject.etag).to eq("\"913b3f4e2ed35371bed5a2ddb54a29f6451d6062f85c3490634a33b0\"") }

  specify { expect(subject.cache_status).to eq("MISS") }

  specify { expect(subject.request_id).to eq("446fb29c-ae44-4636-bce2-bf2beec9a9d9") }

  specify { expect(subject.ratelimit_group).to eq("char-detail") }

  specify { expect(subject.ratelimit_limit).to eq("600/15m") }

  specify { expect(subject.ratelimit_remaining).to eq(598) }

  specify { expect(subject.ratelimit_used).to eq(2) }

  specify { expect(subject.error_limit_remain).to eq(nil) }

  specify { expect(subject.error_limit_reset).to eq(nil) }
end

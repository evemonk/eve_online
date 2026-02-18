# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get current ship" do
  before { VCR.insert_cassette "esi/character_ship/1337512245" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new(token: "token123") }

  subject { client.locations.ship(character_id: 1_337_512_245) }

  specify do
    expect(subject.as_json)
      .to eq(
        ship_item_id: 1_032_641_106_218,
        ship_name: "Johnn Dillinger's Raven",
        ship_type_id: 638
      )
  end

  specify { expect(subject.ship_item_id).to eq(1_032_641_106_218) }

  specify { expect(subject.ship_name).to eq("Johnn Dillinger's Raven") }

  specify { expect(subject.ship_type_id).to eq(638) }

  specify { expect(subject.etag).to eq('"c27423eb18aaa464b3863e852a21a78bc7f857e95e67ea4221b0af78"') }

  specify { expect(subject.cache_status).to eq("MISS") }

  specify { expect(subject.request_id).to eq("ba5c3a4c-6ac4-4621-8655-26dcd7d934e5") }

  specify { expect(subject.ratelimit_group).to eq("char-location") }

  specify { expect(subject.ratelimit_limit).to eq("1200/15m") }

  specify { expect(subject.ratelimit_remaining).to eq(1_198) }

  specify { expect(subject.ratelimit_used).to eq(2) }

  specify { expect(subject.error_limit_remain).to eq(nil) }

  specify { expect(subject.error_limit_reset).to eq(nil) }
end

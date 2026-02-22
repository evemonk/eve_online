# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get character blueprints" do
  before { VCR.insert_cassette "esi/character_blueprints/1337512245" }

  after { VCR.eject_cassette }

  let(:token) { "token123" }

  let(:client) { EveOnline::ESI::Client.new(token: token) }

  subject { client.characters.blueprints(id: 1_337_512_245) }

  specify { expect(subject.page).to eq(1) }

  specify { expect(subject.total_pages).to eq(1) }

  specify { expect(subject.size).to eq(57) }

  specify do
    expect(subject.blueprints.first.as_json).to eq(item_id: 716_338_097,
      location_flag: "Hangar",
      location_id: 1_027_847_409_779,
      material_efficiency: 10,
      quantity: -2,
      runs: 300,
      time_efficiency: 0,
      type_id: 1010)
  end

  specify { expect(subject.etag).to eq("\"fb0a5dd0c47c3be5ce2be7b9b06a737cf653e89f8c9f863ac9d16361\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("481c55c3-24b2-456b-8d6f-298256bf6f51") }

  specify { expect(subject.ratelimit_group).to eq("char-industry") }

  specify { expect(subject.ratelimit_limit).to eq("600/15m") }

  specify { expect(subject.ratelimit_remaining).to eq(597) }

  specify { expect(subject.ratelimit_used).to eq(2) }

  specify { expect(subject.error_limit_remain).to eq(nil) }

  specify { expect(subject.error_limit_reset).to eq(nil) }
end

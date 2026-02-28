# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get clones" do
  before { VCR.insert_cassette "esi/character_clones/1337512245" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new(token: "token123") }

  subject { client.clones.clones(character_id: 1_337_512_245) }

  specify do
    expect(subject.as_json).to eq(
      last_clone_jump_date: Time.utc(2012, 7, 27, 14, 50, 11),
      last_station_change_date: Time.utc(2015, 6, 30, 21, 51, 13)
    )
  end

  specify do
    expect(subject.home_location.as_json).to eq(
      location_id: 60_014_779,
      location_type: "station"
    )
  end

  specify { expect(subject.jump_clones.size).to eq(1) }

  specify do
    expect(subject.jump_clones.first.as_json).to eq(
      implant_ids: [],
      jump_clone_id: 56_228_175,
      location_id: 60_014_101,
      location_type: "station",
      name: nil
    )
  end

  specify { expect(subject.etag).to eq("\"b98b4cafdb5263005015b0a91e1a92465ee0c3078179ff9bedfd944d\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("da8c3bab-8809-440f-8ea8-1c86a0fee3d7") }

  specify { expect(subject.ratelimit_group).to eq("char-location") }

  specify { expect(subject.ratelimit_limit).to eq("1200/15m") }

  specify { expect(subject.ratelimit_remaining).to eq(1_197) }

  specify { expect(subject.ratelimit_used).to eq(2) }

  specify { expect(subject.error_limit_remain).to eq(nil) }

  specify { expect(subject.error_limit_reset).to eq(nil) }
end

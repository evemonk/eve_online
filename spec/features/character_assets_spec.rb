# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get character assets" do
  let(:client) { EveOnline::ESI::Client.new(token: "token123") }

  context "when page is not present" do
    before { VCR.insert_cassette "esi/character_assets/1337512245" }

    after { VCR.eject_cassette }

    subject { client.assets.character(id: 1_337_512_245) }

    specify { expect(subject.size).to eq(1000) }

    specify do
      expect(subject.first.as_json).to eq(
        is_blueprint_copy: true,
        is_singleton: true,
        item_id: 1_033_660_107_682,
        location_flag: "Hangar",
        location_id: 60_002_173,
        location_type: "station",
        quantity: 1,
        type_id: 786
      )
    end

    specify { expect(subject.etag).to eq('"49404e9a764dc77aa92df975e81aaaf623177f27332238d814cd0747"') }

    specify { expect(subject.cache_status).to eq("HIT") }

    specify { expect(subject.request_id).to eq("2d9cd5f6-13d6-45e8-ba24-e02e2f66f299") }

    specify { expect(subject.ratelimit_group).to eq("char-asset") }

    specify { expect(subject.ratelimit_limit).to eq("1800/15m") }

    specify { expect(subject.ratelimit_remaining).to eq(1_798) }

    specify { expect(subject.ratelimit_used).to eq(2) }

    specify { expect(subject.error_limit_remain).to eq(nil) }

    specify { expect(subject.error_limit_reset).to eq(nil) }

    specify { expect(subject.total_pages).to eq(2) }

  end

  context "when page is present" do
    before { VCR.insert_cassette "esi/character_assets/1337512245_page_2" }

    after { VCR.eject_cassette }

    subject { client.assets.character(id: 1_337_512_245, page: 2) }

    specify { expect(subject.size).to eq(189) }

    # specify do
    #   expect(subject.first.as_json).to eq(
    #     is_blueprint_copy: nil,
    #     is_singleton: true,
    #     item_id: 1_007_277_900_730,
    #     location_flag: "RigSlot1",
    #     location_id: 1_007_277_753_840,
    #     location_type: "item",
    #     quantity: 1,
    #     type_id: 31_800
    #   )
    # end

    specify { expect(subject.total_pages).to eq(2) }
  end
end

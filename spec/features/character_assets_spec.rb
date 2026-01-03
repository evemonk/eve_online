# frozen_string_literal: true

require "spec_helper"

describe "Get character assets" do
  let(:client) { EveOnline::ESI::Client.new(token: "token123") }

  # subject { client.assets.character(id: 1_337_512_245) }

  # specify { expect(subject.scope).to eq("esi-assets.read_assets.v1") }

  # specify { expect(subject.page).to eq(1) }

  # specify { expect(subject.total_pages).to eq(2) }

  # specify { expect(subject.assets.size).to eq(1000) }

  # specify do
  #   expect(subject.assets.first.as_json).to eq(
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
  #
  # specify { expect(subject.etag).to eq('"5eedb79d062aad2bed4e103e149ebf728be9f2d69b63ecf186f45c1d"') }
  #
  # specify { expect(subject.cache_status).to eq("HIT") }
  #
  # specify { expect(subject.request_id).to eq("ab376bd9-2f4f-4a7f-809b-7de40de4ef26") }
  #
  # specify { expect(subject.ratelimit_group).to eq(nil) }
  #
  # specify { expect(subject.ratelimit_limit).to eq(nil) }
  #
  # specify { expect(subject.ratelimit_remaining).to eq(nil) }
  #
  # specify { expect(subject.ratelimit_used).to eq(nil) }
  #
  # specify { expect(subject.error_limit_remain).to eq(100) }
  #
  # specify { expect(subject.error_limit_reset).to eq(20) }
  #
  # specify { expect(subject.total_pages).to eq(2) }

  context "when page is not present" do
    before { VCR.insert_cassette "esi/character_assets/1337512245_page_1" }

    after { VCR.eject_cassette }

    subject { client.assets.character(id: 1_337_512_245) }

    specify { expect(subject.assets.size).to eq(1000) }

    specify do
      expect(subject.assets.first.as_json).to eq(
                                                is_blueprint_copy: nil,
                                                is_singleton: true,
                                                item_id: 1_007_277_900_730,
                                                location_flag: "RigSlot1",
                                                location_id: 1_007_277_753_840,
                                                location_type: "item",
                                                quantity: 1,
                                                type_id: 31_800
                                              )
    end

    specify { expect(subject.etag).to eq('"5eedb79d062aad2bed4e103e149ebf728be9f2d69b63ecf186f45c1d"') }

    specify { expect(subject.cache_status).to eq("HIT") }

    specify { expect(subject.request_id).to eq("ab376bd9-2f4f-4a7f-809b-7de40de4ef26") }

    specify { expect(subject.ratelimit_group).to eq(nil) }

    specify { expect(subject.ratelimit_limit).to eq(nil) }

    specify { expect(subject.ratelimit_remaining).to eq(nil) }

    specify { expect(subject.ratelimit_used).to eq(nil) }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(20) }

    specify { expect(subject.total_pages).to eq(2) }

  end

  context "when page is present" do
    before { VCR.insert_cassette "esi/character_assets/1337512245_page_2" }

    after { VCR.eject_cassette }

    subject { client.assets.character(id: 1_337_512_245, page: 2) }

    specify { expect(subject.assets.size).to eq(1000) }

    specify do
      expect(subject.assets.first.as_json).to eq(
                                                is_blueprint_copy: nil,
                                                is_singleton: true,
                                                item_id: 1_007_277_900_730,
                                                location_flag: "RigSlot1",
                                                location_id: 1_007_277_753_840,
                                                location_type: "item",
                                                quantity: 1,
                                                type_id: 31_800
                                              )
    end

    specify { expect(subject.total_pages).to eq(2) }
  end
end

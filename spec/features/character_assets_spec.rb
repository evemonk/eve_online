# frozen_string_literal: true

require "spec_helper"

describe "Get character assets" do
  let(:options) do
    {
      character_id: 1_337_512_245,
      token: "token123",
      page: 1
    }
  end

  before { VCR.insert_cassette "esi/character_assets/1337512245" }

  after { VCR.eject_cassette }

  subject { EveOnline::ESI::CharacterAssets.new(options) }

  specify { expect(subject.scope).to eq("esi-assets.read_assets.v1") }

  specify { expect(subject.page).to eq(1) }

  specify { expect(subject.total_pages).to eq(2) }

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

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(48) }
end

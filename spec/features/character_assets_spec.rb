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
    expect(subject.assets.first.as_json).to eq(is_blueprint_copy: true,
      is_singleton: true,
      item_id: 1_033_660_107_682,
      location_flag: "Hangar",
      location_id: 60_002_173,
      location_type: "station",
      quantity: 1,
      type_id: 786)
  end

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(57) }
end

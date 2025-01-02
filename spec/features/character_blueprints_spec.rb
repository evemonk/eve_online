# frozen_string_literal: true

require "spec_helper"

describe "Get character blueprints" do
  let(:options) do
    {
      character_id: 1_337_512_245,
      token: "token123",
      page: 1
    }
  end

  before { VCR.insert_cassette "esi/character_blueprints/1337512245" }

  after { VCR.eject_cassette }

  subject { EveOnline::ESI::CharacterBlueprints.new(options) }

  specify { expect(subject.scope).to eq("esi-characters.read_blueprints.v1") }

  specify { expect(subject.page).to eq(1) }

  specify { expect(subject.total_pages).to eq(1) }

  specify { expect(subject.blueprints.size).to eq(57) }

  specify do
    expect(subject.blueprints.first.as_json).to eq(item_id: 1_003_026_148_920,
      location_flag: "AssetSafety",
      location_id: 60_013_867,
      material_efficiency: 10,
      quantity: -1,
      runs: -1,
      time_efficiency: 20,
      type_id: 1_152)
  end

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(34) }
end

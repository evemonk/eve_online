# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get character blueprints" do
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

  specify { expect(subject.blueprints.size).to eq(4) }

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

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(4) }
end

# frozen_string_literal: true

require "spec_helper"

describe "Get character asset names" do
  let(:options) do
    {
      character_id: 1_337_512_245,
      item_ids: [1_001_215_602_246],
      token: "token123"
    }
  end

  before { VCR.insert_cassette "esi/character_assets_names/1337512245" }

  after { VCR.eject_cassette }

  subject { EveOnline::ESI::CharacterAssetsNames.new(options) }

  specify { expect(subject.scope).to eq("esi-assets.read_assets.v1") }

  specify { expect(subject.assets_names.size).to eq(1) }

  specify do
    expect(subject.assets_names.first.as_json).to eq(item_id: 1_001_215_602_246,
      name: "HOLE")
  end

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(29) }
end

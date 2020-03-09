# frozen_string_literal: true

require "spec_helper"

describe "Get character assets" do
  context "when etag not set" do
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

    specify { expect(subject.not_modified?).to eq(false) }

    specify { expect(subject.page).to eq(1) }

    specify { expect(subject.total_pages).to eq(2) }

    specify { expect(subject.assets.size).to eq(1000) }

    specify do
      expect(subject.assets.first.as_json).to eq(is_blueprint_copy: nil,
                                                 is_singleton: false,
                                                 item_id: 1_032_486_414_352,
                                                 location_flag: "Hangar",
                                                 location_id: 60_008_674,
                                                 location_type: "station",
                                                 quantity: 300,
                                                 type_id: 213)
    end

    specify { expect(subject.etag).to eq("863823ab27587127fd6e71b394399350577a52f4a5e269e32964018e") }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(29) }
  end

  context "when etag is set" do
    let(:options) do
      {
        character_id: 1_337_512_245,
        token: "token123",
        page: 1,
        etag: "863823ab27587127fd6e71b394399350577a52f4a5e269e32964018e"
      }
    end

    before { VCR.insert_cassette "esi/character_assets/1337512245_with_etag" }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::CharacterAssets.new(options) }

    specify { expect(subject.not_modified?).to eq(true) }

    specify { expect(subject.etag).to eq("863823ab27587127fd6e71b394399350577a52f4a5e269e32964018e") }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(43) }
  end
end

# frozen_string_literal: true

require "spec_helper"

describe "Get character's public information" do
  context "when etag not set" do
    let(:options) { {character_id: 1_337_512_245} }

    before { VCR.insert_cassette "esi/characters/1337512245" }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::Character.new(options) }

    specify { expect(subject.scope).to eq(nil) }

    specify { expect(subject.not_modified?).to eq(false) }

    specify do
      expect(subject.as_json).to eq(corporation_id: 98_565_696,
        birthday: "2010-01-15T15:26:00Z",
        name: "Johnn Dillinger",
        gender: "male",
        race_id: 2,
        bloodline_id: 4,
        description: "",
        alliance_id: 99_008_595,
        security_status: 3.83155339,
        faction_id: nil,
        title: nil)
    end

    specify { expect(subject.etag).to eq("5e57d726eda270ba0e8542bdfbca874c844e5cdbf4b5599eeca79d1f") }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(47) }
  end

  context "when etag is set" do
    let(:options) do
      {
        character_id: 1_337_512_245,
        etag: "5e57d726eda270ba0e8542bdfbca874c844e5cdbf4b5599eeca79d1f"
      }
    end

    before { VCR.insert_cassette "esi/characters/1337512245_with_etag" }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::Character.new(options) }

    specify { expect(subject.not_modified?).to eq(true) }

    specify { expect(subject.etag).to eq("5e57d726eda270ba0e8542bdfbca874c844e5cdbf4b5599eeca79d1f") }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(7) }
  end
end

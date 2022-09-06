# frozen_string_literal: true

require "spec_helper"

describe "Get item group information" do
  context "when etag not set" do
    before { VCR.insert_cassette "esi/universe/groups/450" }

    after { VCR.eject_cassette }

    let(:options) { {group_id: 450, language: "en-us"} }

    subject { EveOnline::ESI::UniverseGroup.new(options) }

    specify { expect(subject.scope).to eq(nil) }

    specify { expect(subject.not_modified?).to eq(false) }

    specify do
      expect(subject.as_json).to eq(category_id: 25,
        id: 450,
        name: "Arkonor",
        published: true)
    end

    specify { expect(subject.type_ids.size).to eq(10) }

    specify { expect(subject.type_ids.first).to eq(22) }

    specify { expect(subject.etag).to eq("37a39e7a5f5ecc07b19a3128c319f1198d035aee10052d0a21ccdd94") }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(26) }
  end

  context "when etag is set" do
    let(:options) do
      {
        group_id: 450,
        language: "en-us",
        etag: "37a39e7a5f5ecc07b19a3128c319f1198d035aee10052d0a21ccdd94"
      }
    end

    before { VCR.insert_cassette "esi/universe/groups/450_with_etag" }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::UniverseGroup.new(options) }

    specify { expect(subject.not_modified?).to eq(true) }

    specify { expect(subject.etag).to eq("37a39e7a5f5ecc07b19a3128c319f1198d035aee10052d0a21ccdd94") }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(25) }
  end
end

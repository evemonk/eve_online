# frozen_string_literal: true

require "spec_helper"

describe "List all public structures" do
  context "without filter" do
    context "when etag not set" do
      before { VCR.insert_cassette "esi/universe/structures" }

      after { VCR.eject_cassette }

      subject { EveOnline::ESI::UniverseStructures.new }

      specify { expect(subject.scope).to eq(nil) }

      specify { expect(subject.not_modified?).to eq(false) }

      specify { expect(subject.structure_ids.size).to eq(3654) }

      specify { expect(subject.structure_ids.first).to eq(1_027_528_548_355) }

      specify { expect(subject.etag).to eq("1b64f9a8268bb3ba350acc7d7116bfd75dd9f88defb1bbc61771aec7") }
    end

    context "when etag is set" do
      before { VCR.insert_cassette "esi/universe/structures_with_etag" }

      after { VCR.eject_cassette }

      subject { EveOnline::ESI::UniverseStructures.new(etag: "1b64f9a8268bb3ba350acc7d7116bfd75dd9f88defb1bbc61771aec7") }

      specify { expect(subject.not_modified?).to eq(true) }

      specify { expect(subject.etag).to eq("1b64f9a8268bb3ba350acc7d7116bfd75dd9f88defb1bbc61771aec7") }
    end
  end

  context "with filter" do
    context "when etag not set" do
      before { VCR.insert_cassette "esi/universe/structures_with_filter" }

      after { VCR.eject_cassette }

      subject { EveOnline::ESI::UniverseStructures.new(filter: "market") }

      specify { expect(subject.not_modified?).to eq(false) }

      specify { expect(subject.structure_ids.size).to eq(108) }

      specify { expect(subject.structure_ids.first).to eq(1_030_490_622_468) }

      specify { expect(subject.etag).to eq("2a825ab50413f1efe5f558b8d093e1299389b2f2ce3fa191907f7209") }
    end

    context "when etag is set" do
      let(:options) do
        {
          filter: "market",
          etag: "2a825ab50413f1efe5f558b8d093e1299389b2f2ce3fa191907f7209",
        }
      end

      before { VCR.insert_cassette "esi/universe/structures_with_filter_and_etag" }

      after { VCR.eject_cassette }

      subject { EveOnline::ESI::UniverseStructures.new(options) }

      specify { expect(subject.not_modified?).to eq(true) }

      specify { expect(subject.etag).to eq("2a825ab50413f1efe5f558b8d093e1299389b2f2ce3fa191907f7209") }
    end
  end
end

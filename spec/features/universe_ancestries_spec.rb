# frozen_string_literal: true

require "spec_helper"

describe "Get ancestries" do
  context "when etag not set" do
    before { VCR.insert_cassette "esi/universe/ancestries" }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::UniverseAncestries.new }

    specify { expect(subject.not_modified?).to eq(false) }

    specify { expect(subject.scope).to eq(nil) }

    specify { expect(subject.ancestries.size).to eq(42) }

    specify do
      expect(subject.ancestries.first.as_json).to eq(ancestry_id: 1,
                                                     bloodline_id: 5,
                                                     description: "Holders, the major landholding class in Amarr society, are generally conservative traditionalists. A few, however, have elected to break ranks with their hidebound and power-hungry peers, instead supporting the modernization of their society's religion and substantial economic reform. Their champion is Catiz Tash-Murkon, the Udorian Royal Heir.",
                                                     icon_id: 1641,
                                                     name: "Liberal Holders",
                                                     short_description: "Progressive members of the upper class who have rejected their traditional ways.")
    end

    specify { expect(subject.etag).to eq("37a39e7a5f5ecc07b19a3128c319f1198d035aee10052d0a21ccdd94") }
  end

  context "when etag is set" do
    before { VCR.insert_cassette "esi/universe/ancestries_with_etag" }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::UniverseAncestries.new(etag: "37a39e7a5f5ecc07b19a3128c319f1198d035aee10052d0a21ccdd94") }

    specify { expect(subject.not_modified?).to eq(true) }

    specify { expect(subject.etag).to eq("37a39e7a5f5ecc07b19a3128c319f1198d035aee10052d0a21ccdd94") }
  end
end

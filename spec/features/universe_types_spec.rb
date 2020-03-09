# frozen_string_literal: true

require "spec_helper"

describe "Get types" do
  context "when etag not set" do
    before { VCR.insert_cassette "esi/universe/types" }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::UniverseTypes.new }

    specify { expect(subject.scope).to eq(nil) }

    specify { expect(subject.not_modified?).to eq(false) }

    specify { expect(subject.page).to eq(1) }

    specify { expect(subject.total_pages).to eq(36) }

    specify { expect(subject.universe_type_ids.size).to eq(1000) }

    specify { expect(subject.universe_type_ids.first).to eq(0) }

    specify { expect(subject.etag).to eq("e3f6a76b4a1287f54966c6253f8f5d6ac6460bc43d47570331b43e0b") }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(45) }
  end

  context "when etag is set" do
    before { VCR.insert_cassette "esi/universe/types_with_etag" }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::UniverseTypes.new(etag: "e3f6a76b4a1287f54966c6253f8f5d6ac6460bc43d47570331b43e0b") }

    specify { expect(subject.not_modified?).to eq(true) }

    specify { expect(subject.etag).to eq("e3f6a76b4a1287f54966c6253f8f5d6ac6460bc43d47570331b43e0b") }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(2) }
  end
end

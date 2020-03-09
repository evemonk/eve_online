# frozen_string_literal: true

require "spec_helper"

describe "Get moon information" do
  context "when etag not set" do
    before { VCR.insert_cassette "esi/universe/moons/40000004" }

    after { VCR.eject_cassette }

    let(:options) { {id: 40_000_004} }

    subject { EveOnline::ESI::UniverseMoon.new(options) }

    specify { expect(subject.scope).to eq(nil) }

    specify { expect(subject.not_modified?).to eq(false) }

    specify do
      expect(subject.as_json).to eq(moon_id: 40_000_004,
                                    name: "Tanoo I - Moon 1",
                                    system_id: 30_000_001)
    end

    specify do
      expect(subject.position.as_json).to eq(x: 162_088_094_286.0,
                                             y: 21_314_854_783.0,
                                             z: -73_598_621_491.0)
    end

    specify { expect(subject.etag).to eq("e3f6a76b4a1287f54966c6253f8f5d6ac6460bc43d47570331b43e0b") }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(59) }
  end

  context "when etag is set" do
    let(:options) do
      {
        id: 40_000_004,
        etag: "e3f6a76b4a1287f54966c6253f8f5d6ac6460bc43d47570331b43e0b"
      }
    end

    before { VCR.insert_cassette "esi/universe/moons/40000004_with_etag" }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::UniverseMoon.new(options) }

    specify { expect(subject.not_modified?).to eq(true) }

    specify { expect(subject.etag).to eq("e3f6a76b4a1287f54966c6253f8f5d6ac6460bc43d47570331b43e0b") }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(35) }
  end
end

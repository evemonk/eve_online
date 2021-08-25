# frozen_string_literal: true

require "spec_helper"

describe "Get character portraits" do
  context "when etag not set" do
    let(:options) do
      {
        character_id: 1_337_512_245
      }
    end

    before { VCR.insert_cassette "esi/character_portraits/1337512245" }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::CharacterPortrait.new(options) }

    specify { expect(subject.scope).to eq(nil) }

    specify { expect(subject.not_modified?).to eq(false) }

    specify do
      expect(subject.as_json).to eq(huge: "https://images.evetech.net/Character/1337512245_512.jpg",
        large: "https://images.evetech.net/Character/1337512245_256.jpg",
        medium: "https://images.evetech.net/Character/1337512245_128.jpg",
        small: "https://images.evetech.net/Character/1337512245_64.jpg")
    end

    specify { expect(subject.etag).to eq("c9ee2790a39f260df1d2bc8f63e0794abc6d22dfd725682f3d48ca54") }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(14) }
  end

  context "when etag is set" do
    let(:options) do
      {
        character_id: 1_337_512_245,
        etag: "c9ee2790a39f260df1d2bc8f63e0794abc6d22dfd725682f3d48ca54"
      }
    end

    before { VCR.insert_cassette "esi/character_portraits/1337512245_with_etag" }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::CharacterPortrait.new(options) }

    specify { expect(subject.not_modified?).to eq(true) }

    specify { expect(subject.etag).to eq("c9ee2790a39f260df1d2bc8f63e0794abc6d22dfd725682f3d48ca54") }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(31) }
  end
end

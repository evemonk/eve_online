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

    specify { expect(subject.etag).to eq("b2caff1ff8ab0f8bdc8ce19423b24e7fc1b2a7b8829d64c0e4ec652f") }
  end

  context "when etag is set" do
    let(:options) do
      {
        character_id: 1_337_512_245,
        etag: "7c3e352530bd9a3e07ffaa978ad52dbb4609fa58f483a7eedea7a287"
      }
    end

    before { VCR.insert_cassette "esi/character_portraits/1337512245_with_etag" }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::CharacterPortrait.new(options) }

    specify { expect(subject.not_modified?).to eq(true) }

    specify { expect(subject.etag).to eq("7c3e352530bd9a3e07ffaa978ad52dbb4609fa58f483a7eedea7a287") }
  end
end

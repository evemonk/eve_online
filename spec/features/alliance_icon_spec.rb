# frozen_string_literal: true

require "spec_helper"

describe "Get alliance icon" do
  context "when etag not set" do
    let(:options) { {alliance_id: 99_005_443} }

    before { VCR.insert_cassette "esi/alliance_icon/99005443" }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::AllianceIcon.new(options) }

    specify { expect(subject.scope).to eq(nil) }

    specify { expect(subject.not_modified?).to eq(false) }

    specify do
      expect(subject.as_json).to eq(icon_medium: "https://images.evetech.net/Alliance/99005443_128.png",
                                    icon_small: "https://images.evetech.net/Alliance/99005443_64.png")
    end

    specify { expect(subject.etag).to eq("b8058de2d9f6c57c6b6d88321742e9676a6f63b96b89238997d37900") }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(11) }
  end

  context "when etag is set" do
    let(:options) do
      {
        alliance_id: 99_005_443,
        etag: "b8058de2d9f6c57c6b6d88321742e9676a6f63b96b89238997d37900"
      }
    end

    before { VCR.insert_cassette "esi/alliance_icon/99005443_with_etag" }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::AllianceIcon.new(options) }

    specify { expect(subject.not_modified?).to eq(true) }

    specify { expect(subject.etag).to eq("b8058de2d9f6c57c6b6d88321742e9676a6f63b96b89238997d37900") }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(4) }
  end
end

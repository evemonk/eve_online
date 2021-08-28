# frozen_string_literal: true

require "spec_helper"

describe "Get alliance icon" do
  context "when etag not set" do
    let(:options) { {alliance_id: 99_008_595} }

    before { VCR.insert_cassette "esi/alliance_icon/99008595" }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::AllianceIcon.new(options) }

    specify { expect(subject.scope).to eq(nil) }

    specify { expect(subject.not_modified?).to eq(false) }

    specify do
      expect(subject.as_json).to eq(icon_medium: "https://images.evetech.net/alliances/99008595/logo?tenant=tranquility&size=128",
        icon_small: "https://images.evetech.net/alliances/99008595/logo?tenant=tranquility&size=64")
    end

    specify { expect(subject.etag).to eq("1e9455f8ecc240e342f79e9225582c582205c50995d5d4d696b87601") }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(10) }
  end

  context "when etag is set" do
    let(:options) do
      {
        alliance_id: 99_008_595,
        etag: "1e9455f8ecc240e342f79e9225582c582205c50995d5d4d696b87601"
      }
    end

    before { VCR.insert_cassette "esi/alliance_icon/99005443_with_etag" }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::AllianceIcon.new(options) }

    specify { expect(subject.not_modified?).to eq(true) }

    specify { expect(subject.etag).to eq("1e9455f8ecc240e342f79e9225582c582205c50995d5d4d696b87601") }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(29) }
  end
end

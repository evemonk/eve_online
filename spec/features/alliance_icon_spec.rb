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
      expect(subject.as_json).to eq(icon_medium: "https://images.evetech.net/alliances/99005443/logo?tenant=tranquility&size=128",
                                    icon_small: "https://images.evetech.net/alliances/99005443/logo?tenant=tranquility&size=64")
    end

    specify { expect(subject.etag).to eq("d067edb53a9019e0e05d99a2b1e7c7745433a982dda16667a14bff49") }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(30) }
  end

  context "when etag is set" do
    let(:options) do
      {
        alliance_id: 99_005_443,
        etag: "d067edb53a9019e0e05d99a2b1e7c7745433a982dda16667a14bff49"
      }
    end

    before { VCR.insert_cassette "esi/alliance_icon/99005443_with_etag" }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::AllianceIcon.new(options) }

    specify { expect(subject.not_modified?).to eq(true) }

    specify { expect(subject.etag).to eq("d067edb53a9019e0e05d99a2b1e7c7745433a982dda16667a14bff49") }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(29) }
  end
end

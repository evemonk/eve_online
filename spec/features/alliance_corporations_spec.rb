# frozen_string_literal: true

require "spec_helper"

describe "List alliance's corporations" do
  context "when etag not set" do
    let(:options) { {alliance_id: 99_008_595} }

    before { VCR.insert_cassette "esi/alliance_corporations/99008595" }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::AllianceCorporations.new(options) }

    specify { expect(subject.scope).to eq(nil) }

    specify { expect(subject.not_modified?).to eq(false) }

    specify { expect(subject.corporation_ids.size).to eq(5) }

    specify { expect(subject.corporation_ids.first).to eq(98_250_226) }

    specify { expect(subject.etag).to eq("c8f68430d2ee6e7c342e9730d3ee4bd0aa2d9eb07c6c493c02cdf3b6") }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(49) }
  end

  context "when etag is set" do
    let(:options) do
      {
        alliance_id: 99_008_595,
        etag: "c8f68430d2ee6e7c342e9730d3ee4bd0aa2d9eb07c6c493c02cdf3b6"
      }
    end

    before { VCR.insert_cassette "esi/alliance_corporations/99008595_with_etag" }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::AllianceCorporations.new(options) }

    specify { expect(subject.not_modified?).to eq(true) }

    specify { expect(subject.etag).to eq("c8f68430d2ee6e7c342e9730d3ee4bd0aa2d9eb07c6c493c02cdf3b6") }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(10) }
  end
end

# frozen_string_literal: true

require "spec_helper"

describe "List alliance's corporations" do
  context "when etag not set" do
    let(:options) { {alliance_id: 99_005_443} }

    before { VCR.insert_cassette "esi/alliance_corporations/99005443" }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::AllianceCorporations.new(options) }

    specify { expect(subject.scope).to eq(nil) }

    specify { expect(subject.not_modified?).to eq(false) }

    specify { expect(subject.corporation_ids.size).to eq(21) }

    specify { expect(subject.corporation_ids.first).to eq(98_192_510) }

    specify { expect(subject.etag).to eq("73da1d3efe2beb32798b8cc6a828ada6cd620fca85f78583a1eb509d") }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(60) }
  end

  context "when etag is set" do
    let(:options) do
      {
        alliance_id: 99_005_443,
        etag: "73da1d3efe2beb32798b8cc6a828ada6cd620fca85f78583a1eb509d"
      }
    end

    before { VCR.insert_cassette "esi/alliance_corporations/99005443_with_etag" }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::AllianceCorporations.new(options) }

    specify { expect(subject.not_modified?).to eq(true) }

    specify { expect(subject.etag).to eq("73da1d3efe2beb32798b8cc6a828ada6cd620fca85f78583a1eb509d") }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(20) }
  end
end

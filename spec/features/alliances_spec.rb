# frozen_string_literal: true

require "spec_helper"

describe "List all alliances" do
  context "when etag not set" do
    before { VCR.insert_cassette "esi/alliances/alliances" }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::Alliances.new }

    specify { expect(subject.not_modified?).to eq(false) }

    specify { expect(subject.scope).to eq(nil) }

    specify { expect(subject.alliance_ids.size).to eq(3072) }

    specify { expect(subject.alliance_ids.first).to eq(99_000_006) }

    specify { expect(subject.etag).to eq("19defb9a9875a079383cda4410475eea6616840593dead413fc0dbfb") }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(38) }
  end

  context "when etag is set" do
    before { VCR.insert_cassette "esi/alliances/alliances_with_etag" }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::Alliances.new(etag: "19defb9a9875a079383cda4410475eea6616840593dead413fc0dbfb") }

    specify { expect(subject.not_modified?).to eq(true) }

    specify { expect(subject.etag).to eq("19defb9a9875a079383cda4410475eea6616840593dead413fc0dbfb") }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(37) }
  end
end

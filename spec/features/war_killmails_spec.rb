# frozen_string_literal: true

require "spec_helper"

describe "List kills for a war" do
  context "when etag not set" do
    let(:options) { {war_id: 615_578} }

    before { VCR.insert_cassette "esi/wars/615578/killmails" }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::WarKillmails.new(options) }

    specify { expect(subject.scope).to eq(nil) }

    specify { expect(subject.not_modified?).to eq(false) }

    specify { expect(subject.page).to eq(1) }

    specify { expect(subject.total_pages).to eq(1) }

    specify { expect(subject.killmails.size).to eq(9) }

    specify do
      expect(subject.killmails.first.as_json).to eq(killmail_hash: "07f7ef1d7f6090e78d8e85b4a98e680f67b5e9d5",
                                                    killmail_id: 72_410_059)
    end

    specify { expect(subject.etag).to eq("12ee36a10ee0dbfb7f6691e1b27c8400fdca645f15e70ebc0a94b7ae") }
  end

  context "when etag is set" do
    let(:options) do
      {
        war_id: 615_578,
        etag: "12ee36a10ee0dbfb7f6691e1b27c8400fdca645f15e70ebc0a94b7ae",
      }
    end

    before { VCR.insert_cassette "esi/wars/615578/killmails_with_etag" }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::WarKillmails.new(options) }

    specify { expect(subject.not_modified?).to eq(true) }

    specify { expect(subject.etag).to eq("12ee36a10ee0dbfb7f6691e1b27c8400fdca645f15e70ebc0a94b7ae") }
  end
end

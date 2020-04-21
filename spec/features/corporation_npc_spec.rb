# frozen_string_literal: true

require "spec_helper"

describe "Get npc corporations" do
  context "when etag not set" do
    before { VCR.insert_cassette "esi/corporation_npc" }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::CorporationNPC.new }

    specify { expect(subject.scope).to eq(nil) }

    specify { expect(subject.not_modified?).to eq(false) }

    specify { expect(subject.corporation_npc_ids.size).to eq(262) }

    specify { expect(subject.corporation_npc_ids.first).to eq(1_000_001) }

    specify { expect(subject.etag).to eq("085946820256a4f7be2e9926e9d1de9e420cca53ffb31f7547740a05") }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(4) }
  end

  context "when etag is set" do
    let(:options) do
      {
        etag: "085946820256a4f7be2e9926e9d1de9e420cca53ffb31f7547740a05"
      }
    end

    before { VCR.insert_cassette "esi/corporation_npc_with_etag" }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::CorporationNPC.new(options) }

    specify { expect(subject.not_modified?).to eq(true) }

    specify { expect(subject.etag).to eq("085946820256a4f7be2e9926e9d1de9e420cca53ffb31f7547740a05") }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(37) }
  end
end

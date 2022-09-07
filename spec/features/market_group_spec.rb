# frozen_string_literal: true

require "spec_helper"

describe "Get item group information" do
  context "when etag not set" do
    before { VCR.insert_cassette "esi/market/groups/618" }

    after { VCR.eject_cassette }

    let(:options) { {market_group_id: 618} }

    subject { EveOnline::ESI::MarketGroup.new(options) }

    specify { expect(subject.not_modified?).to eq(false) }

    specify { expect(subject.scope).to eq(nil) }

    specify do
      expect(subject.as_json).to eq(description: "Implants intended for Subcervical Processing Slot 1.",
        id: 618,
        name: "Implant Slot 01",
        parent_group_id: 532)
    end

    specify { expect(subject.type_ids.size).to eq(48) }

    specify { expect(subject.type_ids.first).to eq(28_802) }

    specify { expect(subject.etag).to eq("bf7832bfc20f5f9fdeddc9cb0360b941067310e7e3a2a80315b45a43") }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(16) }
  end

  context "when etag is set" do
    before { VCR.insert_cassette "esi/market/groups/618_with_etag" }

    after { VCR.eject_cassette }

    let(:options) do
      {
        market_group_id: 618,
        etag: "bf7832bfc20f5f9fdeddc9cb0360b941067310e7e3a2a80315b45a43"
      }
    end

    subject { EveOnline::ESI::MarketGroup.new(options) }

    specify { expect(subject.not_modified?).to eq(true) }

    specify { expect(subject.etag).to eq("bf7832bfc20f5f9fdeddc9cb0360b941067310e7e3a2a80315b45a43") }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(32) }
  end
end

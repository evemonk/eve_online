# frozen_string_literal: true

require "spec_helper"

describe "Get item groups" do
  context "when etag not set" do
    before { VCR.insert_cassette "esi/market/groups" }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::MarketGroups.new }

    specify { expect(subject.scope).to eq(nil) }

    specify { expect(subject.not_modified?).to eq(false) }

    specify { expect(subject.market_group_ids.size).to eq(1872) }

    specify { expect(subject.market_group_ids.first).to eq(2) }

    specify { expect(subject.etag).to eq("bf7832bfc20f5f9fdeddc9cb0360b941067310e7e3a2a80315b45a43") }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(49) }
  end

  context "when etag is set" do
    before { VCR.insert_cassette "esi/market/groups_with_etag" }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::MarketGroups.new(etag: "bf7832bfc20f5f9fdeddc9cb0360b941067310e7e3a2a80315b45a43") }

    specify { expect(subject.not_modified?).to eq(true) }

    specify { expect(subject.etag).to eq("bf7832bfc20f5f9fdeddc9cb0360b941067310e7e3a2a80315b45a43") }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(5) }
  end
end

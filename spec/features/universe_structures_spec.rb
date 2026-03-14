# frozen_string_literal: true

require "spec_helper"

RSpec.describe "List all public structures" do
  context "without filter" do
    before { VCR.insert_cassette "esi/universe/structures" }

    after { VCR.eject_cassette }

    let(:client) { EveOnline::ESI::Client.new }

    subject { client.universe.structures }

    specify { expect(subject.structure_ids.size).to eq(1_003) }

    specify { expect(subject.structure_ids.first).to eq(1_035_768_592_387) }

    specify { expect(subject.etag).to eq("\"6f6b3e227e2d32a3cfa9bcb927e65406023b0557c8b825fab44aa410\"") }

    specify { expect(subject.cache_status).to eq("HIT") }

    specify { expect(subject.request_id).to eq("2a261e07-ab28-4b06-81e5-b325b3ccb912") }

    specify { expect(subject.ratelimit_group).to eq(nil) }

    specify { expect(subject.ratelimit_limit).to eq(nil) }

    specify { expect(subject.ratelimit_remaining).to eq(nil) }

    specify { expect(subject.ratelimit_used).to eq(nil) }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(6) }
  end

  context "with filter" do
    before { VCR.insert_cassette "esi/universe/structures_with_filter" }

    after { VCR.eject_cassette }

    let(:client) { EveOnline::ESI::Client.new }

    subject { client.universe.structures(filter: "market") }

    specify { expect(subject.structure_ids.size).to eq(53) }

    specify { expect(subject.structure_ids.first).to eq(1_044_961_079_041) }
  end
end

# frozen_string_literal: true

require "spec_helper"

RSpec.describe "List all public structures" do
  context "without filter" do
    before { VCR.insert_cassette "esi/universe/structures" }

    after { VCR.eject_cassette }

    let(:client) { EveOnline::ESI::Client.new }

    subject { client.universe.structures }

    specify { expect(subject.structure_ids.size).to eq(803) }

    specify { expect(subject.structure_ids.first).to eq(1_035_768_592_387) }

    specify { expect(subject.etag).to eq("\"a6e11e96e9fc9e68b40c3484a5d410df96746fa9c46142a3073290bd\"") }

    specify { expect(subject.cache_status).to eq("HIT") }

    specify { expect(subject.request_id).to eq("0d51045c-3df9-4bb8-9670-53ec5c5b1377") }

    specify { expect(subject.ratelimit_group).to eq(nil) }

    specify { expect(subject.ratelimit_limit).to eq(nil) }

    specify { expect(subject.ratelimit_remaining).to eq(nil) }

    specify { expect(subject.ratelimit_used).to eq(nil) }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(35) }
  end

  context "with filter" do
    before { VCR.insert_cassette "esi/universe/structures_with_filter" }

    after { VCR.eject_cassette }

    let(:client) { EveOnline::ESI::Client.new }

    subject { client.universe.structures(filter: "market") }

    specify { expect(subject.structure_ids.size).to eq(49) }

    specify { expect(subject.structure_ids.first).to eq(1_044_961_079_041) }

    specify { expect(subject.etag).to eq("\"e97aedd062b977ea6b97d580099b328c27182aaf5720396617a985e6\"") }

    specify { expect(subject.cache_status).to eq("HIT") }

    specify { expect(subject.request_id).to eq("ca2990e6-44d7-475a-a4cb-749310c42ffc") }

    specify { expect(subject.ratelimit_group).to eq(nil) }

    specify { expect(subject.ratelimit_limit).to eq(nil) }

    specify { expect(subject.ratelimit_remaining).to eq(nil) }

    specify { expect(subject.ratelimit_used).to eq(nil) }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(35) }
  end
end

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

    specify { expect(subject.request_id).to eq("e1e48375-5abf-4f89-a1b1-620f3ef554ad") }

    specify { expect(subject.ratelimit_group).to eq(nil) }

    specify { expect(subject.ratelimit_limit).to eq(nil) }

    specify { expect(subject.ratelimit_remaining).to eq(nil) }

    specify { expect(subject.ratelimit_used).to eq(nil) }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(21) }
  end

  # context "with filter" do
  #   before { VCR.insert_cassette "esi/universe/structures_with_filter" }
  #
  #   after { VCR.eject_cassette }
  #
  #   subject { EveOnline::ESI::UniverseStructures.new(filter: "market") }
  #
  #   specify { expect(subject.structure_ids.size).to eq(108) }
  #
  #   specify { expect(subject.structure_ids.first).to eq(1_030_490_622_468) }
  #
  #   specify { expect(subject.error_limit_remain).to eq(100) }
  #
  #   specify { expect(subject.error_limit_reset).to eq(55) }
  # end
end

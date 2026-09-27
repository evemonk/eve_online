# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get types in a region's market" do
  before { VCR.insert_cassette "esi/market/10000002/types" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.market.types(region_id: 10_000_002) }

  specify { expect(subject.type_ids.size).to eq(1000) }

  specify { expect(subject.type_ids.first).to eq(49_152) }
end

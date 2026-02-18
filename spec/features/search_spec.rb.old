# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Search for a resource" do
  before { VCR.insert_cassette "esi/search" }

  after { VCR.eject_cassette }

  let(:options) do
    {
      search: "Jita",
      categories: ["solar_system"],
      strict: true
    }
  end

  subject { EveOnline::ESI::Search.new(options) }

  specify { expect(subject.scope).to eq(nil) }

  specify do
    expect(subject.as_json).to eq(agent_ids: [],
      alliance_ids: [],
      character_ids: [],
      constellation_ids: [],
      corporation_ids: [],
      faction_ids: [],
      inventory_type_ids: [],
      region_ids: [],
      solar_system_ids: [30_000_142],
      station_ids: [])
  end

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(52) }
end

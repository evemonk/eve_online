# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Search on a string" do
  context "with agent name" do
    before { VCR.insert_cassette "esi/search/agent" }

    after { VCR.eject_cassette }

    let(:client) { EveOnline::ESI::Client.new(token: "token123") }

    subject { client.search.search(character_id: 1337512245, categories: ["agent"], search: "Anuko Hugandur") }

    specify { expect(subject.etag).to eq("W/\"d53e06315fe6f15f4dd47da86f16b3cb51977abc22701227d931f03b\"") }

    specify { expect(subject.cache_status).to eq("HIT") }

    specify { expect(subject.request_id).to eq("4cd7fc66-7920-414a-a2fe-a503582ad0d8") }

    specify { expect(subject.ratelimit_group).to eq(nil) }

    specify { expect(subject.ratelimit_limit).to eq(nil) }

    specify { expect(subject.ratelimit_remaining).to eq(nil) }

    specify { expect(subject.ratelimit_used).to eq(nil) }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(44) }
  end

  context "with alliance name" do
    before { VCR.insert_cassette "esi/search/alliance" }

    after { VCR.eject_cassette }

    let(:client) { EveOnline::ESI::Client.new(token: "token123") }

    subject { client.search.search(character_id: 1337512245, categories: ["alliance"], search: "Pandemic Horde") }

    specify { expect(subject.cache_status).to eq("HIT") }
  end

  context "with character name" do
    before { VCR.insert_cassette "esi/search/character" }

    after { VCR.eject_cassette }

    let(:client) { EveOnline::ESI::Client.new(token: "token123") }

    subject { client.search.search(character_id: 1337512245, categories: ["character"], search: "Johnn Dillinger") }

    specify { expect(subject.cache_status).to eq("HIT") }
  end

  context "with constellation name" do
    before { VCR.insert_cassette "esi/search/constellation" }

    after { VCR.eject_cassette }

    let(:client) { EveOnline::ESI::Client.new(token: "token123") }

    subject { client.search.search(character_id: 1337512245, categories: ["constellation"], search: "San Matar") }

    specify { expect(subject.cache_status).to eq("HIT") }
  end

  context "with corporation name" do
    before { VCR.insert_cassette "esi/search/corporation" }

    after { VCR.eject_cassette }

    let(:client) { EveOnline::ESI::Client.new(token: "token123") }

    subject { client.search.search(character_id: 1337512245, categories: ["corporation"], search: "Freighting Solutions Inc.") }

    specify { expect(subject.cache_status).to eq("HIT") }
  end

  context "with faction name" do
    before { VCR.insert_cassette "esi/search/faction" }

    after { VCR.eject_cassette }

    let(:client) { EveOnline::ESI::Client.new(token: "token123") }

    subject { client.search.search(character_id: 1337512245, categories: ["faction"], search: "Minmatar Republic") }

    specify { expect(subject.cache_status).to eq("HIT") }
  end

  context "with inventory_type name" do
    before { VCR.insert_cassette "esi/search/inventory_type" }

    after { VCR.eject_cassette }

    let(:client) { EveOnline::ESI::Client.new(token: "token123") }

    subject { client.search.search(character_id: 1337512245, categories: ["inventory_type"], search: "150mm Light AutoCannon I Blueprint") }

    specify { expect(subject.cache_status).to eq("HIT") }
  end

  context "with region name" do
    before { VCR.insert_cassette "esi/search/region" }

    after { VCR.eject_cassette }

    let(:client) { EveOnline::ESI::Client.new(token: "token123") }

    subject { client.search.search(character_id: 1337512245, categories: ["region"], search: "Derelik") }

    specify { expect(subject.cache_status).to eq("HIT") }
  end

  context "with solar_system name" do
    before { VCR.insert_cassette "esi/search/solar_system" }

    after { VCR.eject_cassette }

    let(:client) { EveOnline::ESI::Client.new(token: "token123") }

    subject { client.search.search(character_id: 1337512245, categories: ["solar_system"], search: "Tanoo") }

    specify { expect(subject.cache_status).to eq("HIT") }
  end

  context "with station name"

  context "with structure name"

  # before { VCR.insert_cassette "esi/search/agent" }
  #
  # after { VCR.eject_cassette }
  #
  # let(:options) do
  #   {
  #     search: "Jita",
  #     categories: ["solar_system"],
  #     strict: true
  #   }
  # end
  #
  # subject { EveOnline::ESI::Search.new(options) }
  #
  # specify { expect(subject.scope).to eq(nil) }
  #
  # specify do
  #   expect(subject.as_json).to eq(agent_ids: [],
  #     alliance_ids: [],
  #     character_ids: [],
  #     constellation_ids: [],
  #     corporation_ids: [],
  #     faction_ids: [],
  #     inventory_type_ids: [],
  #     region_ids: [],
  #     solar_system_ids: [30_000_142],
  #     station_ids: [])
  # end
  #
  # specify { expect(subject.error_limit_remain).to eq(100) }
  #
  # specify { expect(subject.error_limit_reset).to eq(52) }
end

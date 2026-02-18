# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Search on a string" do
  context "with agent name" do
    before { VCR.insert_cassette "esi/search/agent" }

    after { VCR.eject_cassette }

    let(:client) { EveOnline::ESI::Client.new(token: "token123") }

    subject { client.search.search(character_id: 1_337_512_245, categories: ["agent"], search: "Anuko Hugandur") }

    specify do
      expect(subject.as_json).to eq(
        agent_ids: [3_018_679],
        alliance_ids: []
      )
    end

    specify { expect(subject.etag).to eq("\"e3414e30d339dd73252ab54c2a98a5a693c04ef92920401a5cc47d2f\"") }

    specify { expect(subject.cache_status).to eq("HIT") }

    specify { expect(subject.request_id).to eq("ee836ac1-8202-4e5b-9ab5-70f786bed547") }

    specify { expect(subject.ratelimit_group).to eq(nil) }

    specify { expect(subject.ratelimit_limit).to eq(nil) }

    specify { expect(subject.ratelimit_remaining).to eq(nil) }

    specify { expect(subject.ratelimit_used).to eq(nil) }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(39) }
  end

  context "with alliance name" do
    before { VCR.insert_cassette "esi/search/alliance" }

    after { VCR.eject_cassette }

    let(:client) { EveOnline::ESI::Client.new(token: "token123") }

    subject { client.search.search(character_id: 1_337_512_245, categories: ["alliance"], search: "Pandemic Horde") }

    specify do
      expect(subject.as_json).to eq(
        agent_ids: [],
        alliance_ids: [99_005_338]
      )
    end
  end

  context "with character name" do
    before { VCR.insert_cassette "esi/search/character" }

    after { VCR.eject_cassette }

    let(:client) { EveOnline::ESI::Client.new(token: "token123") }

    subject { client.search.search(character_id: 1_337_512_245, categories: ["character"], search: "Johnn Dillinger") }

    specify do
      expect(subject.as_json).to eq(
        agent_ids: [],
        alliance_ids: []
      )
    end
  end

  context "with constellation name" do
    before { VCR.insert_cassette "esi/search/constellation" }

    after { VCR.eject_cassette }

    let(:client) { EveOnline::ESI::Client.new(token: "token123") }

    subject { client.search.search(character_id: 1_337_512_245, categories: ["constellation"], search: "San Matar") }

    specify do
      expect(subject.as_json).to eq(
        agent_ids: [],
        alliance_ids: []
      )
    end
  end

  context "with corporation name" do
    before { VCR.insert_cassette "esi/search/corporation" }

    after { VCR.eject_cassette }

    let(:client) { EveOnline::ESI::Client.new(token: "token123") }

    subject { client.search.search(character_id: 1_337_512_245, categories: ["corporation"], search: "Freighting Solutions Inc.") }

    specify do
      expect(subject.as_json).to eq(
        agent_ids: [],
        alliance_ids: []
      )
    end
  end

  context "with faction name" do
    before { VCR.insert_cassette "esi/search/faction" }

    after { VCR.eject_cassette }

    let(:client) { EveOnline::ESI::Client.new(token: "token123") }

    subject { client.search.search(character_id: 1_337_512_245, categories: ["faction"], search: "Minmatar Republic") }

    specify do
      expect(subject.as_json).to eq(
        agent_ids: [],
        alliance_ids: []
      )
    end
  end

  context "with inventory_type name" do
    before { VCR.insert_cassette "esi/search/inventory_type" }

    after { VCR.eject_cassette }

    let(:client) { EveOnline::ESI::Client.new(token: "token123") }

    subject { client.search.search(character_id: 1_337_512_245, categories: ["inventory_type"], search: "150mm Light AutoCannon I Blueprint") }

    specify do
      expect(subject.as_json).to eq(
        agent_ids: [],
        alliance_ids: []
      )
    end
  end

  context "with region name" do
    before { VCR.insert_cassette "esi/search/region" }

    after { VCR.eject_cassette }

    let(:client) { EveOnline::ESI::Client.new(token: "token123") }

    subject { client.search.search(character_id: 1_337_512_245, categories: ["region"], search: "Derelik") }

    specify do
      expect(subject.as_json).to eq(
        agent_ids: [],
        alliance_ids: []
      )
    end
  end

  context "with solar_system name" do
    before { VCR.insert_cassette "esi/search/solar_system" }

    after { VCR.eject_cassette }

    let(:client) { EveOnline::ESI::Client.new(token: "token123") }

    subject { client.search.search(character_id: 1_337_512_245, categories: ["solar_system"], search: "Tanoo") }

    specify do
      expect(subject.as_json).to eq(
        agent_ids: [],
        alliance_ids: []
      )
    end
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

# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Search on a string" do
  let(:token) { "token123" }

  context "with agent name" do
    before { VCR.insert_cassette "esi/search/agent" }

    after { VCR.eject_cassette }

    let(:client) { EveOnline::ESI::Client.new(token: token) }

    subject { client.search.search(character_id: 1_337_512_245, categories: ["agent"], search: "Anuko Hugandur") }

    specify do
      expect(subject.as_json).to eq(
        agent_ids: [3_018_679],
        alliance_ids: [],
        character_ids: [],
        constellation_ids: [],
        corporation_ids: [],
        faction_ids: [],
        inventory_type_ids: [],
        region_ids: [],
        solar_system_ids: [],
        station_ids: [],
        structure_ids: []
      )
    end

    specify { expect(subject.etag).to eq("\"e3414e30d339dd73252ab54c2a98a5a693c04ef92920401a5cc47d2f\"") }

    specify { expect(subject.cache_status).to eq("MISS") }

    specify { expect(subject.request_id).to eq("869562c7-2ea7-415a-a403-8db0a52e4aad") }

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

    let(:client) { EveOnline::ESI::Client.new(token: token) }

    subject { client.search.search(character_id: 1_337_512_245, categories: ["alliance"], search: "Pandemic Horde") }

    specify do
      expect(subject.as_json).to eq(
        agent_ids: [],
        alliance_ids: [99_005_338],
        character_ids: [],
        constellation_ids: [],
        corporation_ids: [],
        faction_ids: [],
        inventory_type_ids: [],
        region_ids: [],
        solar_system_ids: [],
        station_ids: [],
        structure_ids: []
      )
    end
  end

  context "with character name" do
    before { VCR.insert_cassette "esi/search/character" }

    after { VCR.eject_cassette }

    let(:client) { EveOnline::ESI::Client.new(token: token) }

    subject { client.search.search(character_id: 1_337_512_245, categories: ["character"], search: "Johnn Dillinger") }

    specify do
      expect(subject.as_json).to eq(
        agent_ids: [],
        alliance_ids: [],
        character_ids: [92_735_926, 1_337_512_245, 2_118_559_910, 1_756_844_186, 2_112_182_108],
        constellation_ids: [],
        corporation_ids: [],
        faction_ids: [],
        inventory_type_ids: [],
        region_ids: [],
        solar_system_ids: [],
        station_ids: [],
        structure_ids: []
      )
    end
  end

  context "with constellation name" do
    before { VCR.insert_cassette "esi/search/constellation" }

    after { VCR.eject_cassette }

    let(:client) { EveOnline::ESI::Client.new(token: token) }

    subject { client.search.search(character_id: 1_337_512_245, categories: ["constellation"], search: "San Matar") }

    specify do
      expect(subject.as_json).to eq(
        agent_ids: [],
        alliance_ids: [],
        character_ids: [],
        constellation_ids: [20_000_001],
        corporation_ids: [],
        faction_ids: [],
        inventory_type_ids: [],
        region_ids: [],
        solar_system_ids: [],
        station_ids: [],
        structure_ids: []
      )
    end
  end

  context "with corporation name" do
    before { VCR.insert_cassette "esi/search/corporation" }

    after { VCR.eject_cassette }

    let(:client) { EveOnline::ESI::Client.new(token: token) }

    subject { client.search.search(character_id: 1_337_512_245, categories: ["corporation"], search: "Freighting Solutions Inc.") }

    specify do
      expect(subject.as_json).to eq(
        agent_ids: [],
        alliance_ids: [],
        character_ids: [],
        constellation_ids: [],
        corporation_ids: [98_565_696],
        faction_ids: [],
        inventory_type_ids: [],
        region_ids: [],
        solar_system_ids: [],
        station_ids: [],
        structure_ids: []
      )
    end
  end

  context "with faction name" do
    before { VCR.insert_cassette "esi/search/faction" }

    after { VCR.eject_cassette }

    let(:client) { EveOnline::ESI::Client.new(token: token) }

    subject { client.search.search(character_id: 1_337_512_245, categories: ["faction"], search: "Minmatar Republic") }

    specify do
      expect(subject.as_json).to eq(
        agent_ids: [],
        alliance_ids: [],
        character_ids: [],
        constellation_ids: [],
        corporation_ids: [],
        faction_ids: [500_002],
        inventory_type_ids: [],
        region_ids: [],
        solar_system_ids: [],
        station_ids: [],
        structure_ids: []
      )
    end
  end

  context "with inventory_type name" do
    before { VCR.insert_cassette "esi/search/inventory_type" }

    after { VCR.eject_cassette }

    let(:client) { EveOnline::ESI::Client.new(token: token) }

    subject { client.search.search(character_id: 1_337_512_245, categories: ["inventory_type"], search: "150mm Light AutoCannon I Blueprint") }

    specify do
      expect(subject.as_json).to eq(
        agent_ids: [],
        alliance_ids: [],
        character_ids: [],
        constellation_ids: [],
        corporation_ids: [],
        faction_ids: [],
        inventory_type_ids: [16_032, 820],
        region_ids: [],
        solar_system_ids: [],
        station_ids: [],
        structure_ids: []
      )
    end
  end

  context "with region name" do
    before { VCR.insert_cassette "esi/search/region" }

    after { VCR.eject_cassette }

    let(:client) { EveOnline::ESI::Client.new(token: token) }

    subject { client.search.search(character_id: 1_337_512_245, categories: ["region"], search: "Derelik") }

    specify do
      expect(subject.as_json).to eq(
        agent_ids: [],
        alliance_ids: [],
        character_ids: [],
        constellation_ids: [],
        corporation_ids: [],
        faction_ids: [],
        inventory_type_ids: [],
        region_ids: [10_000_001],
        solar_system_ids: [],
        station_ids: [],
        structure_ids: []
      )
    end
  end

  context "with solar_system name" do
    before { VCR.insert_cassette "esi/search/solar_system" }

    after { VCR.eject_cassette }

    let(:client) { EveOnline::ESI::Client.new(token: token) }

    subject { client.search.search(character_id: 1_337_512_245, categories: ["solar_system"], search: "Tanoo") }

    specify do
      expect(subject.as_json).to eq(
        agent_ids: [],
        alliance_ids: [],
        character_ids: [],
        constellation_ids: [],
        corporation_ids: [],
        faction_ids: [],
        inventory_type_ids: [],
        region_ids: [],
        solar_system_ids: [30_000_001],
        station_ids: [],
        structure_ids: []
      )
    end
  end

  context "with station name" do
    before { VCR.insert_cassette "esi/search/station" }

    after { VCR.eject_cassette }

    let(:client) { EveOnline::ESI::Client.new(token: token) }

    subject { client.search.search(character_id: 1_337_512_245, categories: ["station"], search: "Tanoo V - Moon 1 - Ammatar Consulate Bureau") }

    specify do
      expect(subject.as_json).to eq(
        agent_ids: [],
        alliance_ids: [],
        character_ids: [],
        constellation_ids: [],
        corporation_ids: [],
        faction_ids: [],
        inventory_type_ids: [],
        region_ids: [],
        solar_system_ids: [],
        station_ids: [60_012_526],
        structure_ids: [],
      )
    end
  end

  context "with structure name" do
    # TODO: write example
  end

  context "with strict" do
    before { VCR.insert_cassette "esi/search/strict" }

    after { VCR.eject_cassette }

    let(:client) { EveOnline::ESI::Client.new(token: token) }

    subject { client.search.search(character_id: 1_337_512_245, categories: ["character"], search: "Johnn Dillinger", strict: true) }

    specify do
      expect(subject.as_json).to eq(
        agent_ids: [],
        alliance_ids: [],
        character_ids: [1_337_512_245],
        constellation_ids: [],
        corporation_ids: [],
        faction_ids: [],
        inventory_type_ids: [],
        region_ids: [],
        solar_system_ids: [],
        station_ids: [],
        structure_ids: []
      )
    end
  end
end

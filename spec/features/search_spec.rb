# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Search on a string" do
  let(:token) { "token123" }

  context "with agent name" do
    before { VCR.insert_cassette "esi/search/agent" }

    after { VCR.eject_cassette }

    let(:client) { EveOnline::ESI::Client.new(token: token) }

    subject { client.search.search(id: 1_337_512_245, categories: ["agent"], search: "Anuko Hugandur") }

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

    subject { client.search.search(id: 1_337_512_245, categories: ["alliance"], search: "Pandemic Horde") }

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

    specify { expect(subject.etag).to eq("\"817f34a47730a646160a5957868a1861531dc9c0f42636ed8ec86b5c\"") }

    specify { expect(subject.cache_status).to eq("MISS") }

    specify { expect(subject.request_id).to eq("f3ae285d-2c0a-48d8-8441-c9068901c2d7") }

    specify { expect(subject.ratelimit_group).to eq(nil) }

    specify { expect(subject.ratelimit_limit).to eq(nil) }

    specify { expect(subject.ratelimit_remaining).to eq(nil) }

    specify { expect(subject.ratelimit_used).to eq(nil) }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(44) }
  end

  context "with character name" do
    before { VCR.insert_cassette "esi/search/character" }

    after { VCR.eject_cassette }

    let(:client) { EveOnline::ESI::Client.new(token: token) }

    subject { client.search.search(id: 1_337_512_245, categories: ["character"], search: "Johnn Dillinger") }

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

    specify { expect(subject.etag).to eq("\"bc11e5a617109055d312c1c5ddd3e038389d6e414f472c2b6ff987d0\"") }

    specify { expect(subject.cache_status).to eq("MISS") }

    specify { expect(subject.request_id).to eq("e8371eed-c083-410f-b6a9-7ebfc0a3c2ba") }

    specify { expect(subject.ratelimit_group).to eq(nil) }

    specify { expect(subject.ratelimit_limit).to eq(nil) }

    specify { expect(subject.ratelimit_remaining).to eq(nil) }

    specify { expect(subject.ratelimit_used).to eq(nil) }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(43) }
  end

  context "with constellation name" do
    before { VCR.insert_cassette "esi/search/constellation" }

    after { VCR.eject_cassette }

    let(:client) { EveOnline::ESI::Client.new(token: token) }

    subject { client.search.search(id: 1_337_512_245, categories: ["constellation"], search: "San Matar") }

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

    specify { expect(subject.etag).to eq("\"3f0adc08490d065053e38fe44464b50824f5bb3c184c3cb4ce27d6b5\"") }

    specify { expect(subject.cache_status).to eq("MISS") }

    specify { expect(subject.request_id).to eq("27b47a12-517d-4c7c-8eba-c7f685e40336") }

    specify { expect(subject.ratelimit_group).to eq(nil) }

    specify { expect(subject.ratelimit_limit).to eq(nil) }

    specify { expect(subject.ratelimit_remaining).to eq(nil) }

    specify { expect(subject.ratelimit_used).to eq(nil) }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(43) }
  end

  context "with corporation name" do
    before { VCR.insert_cassette "esi/search/corporation" }

    after { VCR.eject_cassette }

    let(:client) { EveOnline::ESI::Client.new(token: token) }

    subject { client.search.search(id: 1_337_512_245, categories: ["corporation"], search: "Freighting Solutions Inc.") }

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

    specify { expect(subject.etag).to eq("\"be822aced0bcd9a163b5db9f2bf47bbe7ca6b8e4ec5732845680f1ba\"") }

    specify { expect(subject.cache_status).to eq("MISS") }

    specify { expect(subject.request_id).to eq("1d9aa9d3-c2f5-4ea8-9fff-d577a066839c") }

    specify { expect(subject.ratelimit_group).to eq(nil) }

    specify { expect(subject.ratelimit_limit).to eq(nil) }

    specify { expect(subject.ratelimit_remaining).to eq(nil) }

    specify { expect(subject.ratelimit_used).to eq(nil) }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(43) }
  end

  context "with faction name" do
    before { VCR.insert_cassette "esi/search/faction" }

    after { VCR.eject_cassette }

    let(:client) { EveOnline::ESI::Client.new(token: token) }

    subject { client.search.search(id: 1_337_512_245, categories: ["faction"], search: "Minmatar Republic") }

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

    specify { expect(subject.etag).to eq("\"90f3141f268d510647bc84848c5667de6b66551dc9964b511e812b8e\"") }

    specify { expect(subject.cache_status).to eq("MISS") }

    specify { expect(subject.request_id).to eq("e8b502c1-779d-4809-84c7-26a7a8900b7d") }

    specify { expect(subject.ratelimit_group).to eq(nil) }

    specify { expect(subject.ratelimit_limit).to eq(nil) }

    specify { expect(subject.ratelimit_remaining).to eq(nil) }

    specify { expect(subject.ratelimit_used).to eq(nil) }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(42) }
  end

  context "with inventory_type name" do
    before { VCR.insert_cassette "esi/search/inventory_type" }

    after { VCR.eject_cassette }

    let(:client) { EveOnline::ESI::Client.new(token: token) }

    subject { client.search.search(id: 1_337_512_245, categories: ["inventory_type"], search: "150mm Light AutoCannon I Blueprint") }

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

    specify { expect(subject.etag).to eq("\"1051a843ad4ef8fb44ee384560f46c1a1fe132fbede6a329fa028b3f\"") }

    specify { expect(subject.cache_status).to eq("MISS") }

    specify { expect(subject.request_id).to eq("832c6d93-5eda-4406-a7d6-cb71688b7858") }

    specify { expect(subject.ratelimit_group).to eq(nil) }

    specify { expect(subject.ratelimit_limit).to eq(nil) }

    specify { expect(subject.ratelimit_remaining).to eq(nil) }

    specify { expect(subject.ratelimit_used).to eq(nil) }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(42) }
  end

  context "with region name" do
    before { VCR.insert_cassette "esi/search/region" }

    after { VCR.eject_cassette }

    let(:client) { EveOnline::ESI::Client.new(token: token) }

    subject { client.search.search(id: 1_337_512_245, categories: ["region"], search: "Derelik") }

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

    specify { expect(subject.etag).to eq("\"b04874d0741969706b389db65826cf8d5bfe9a4fb0b6b8df212f6e8c\"") }

    specify { expect(subject.cache_status).to eq("MISS") }

    specify { expect(subject.request_id).to eq("652a70e5-d3e5-41f7-8af2-1ff0d822471a") }

    specify { expect(subject.ratelimit_group).to eq(nil) }

    specify { expect(subject.ratelimit_limit).to eq(nil) }

    specify { expect(subject.ratelimit_remaining).to eq(nil) }

    specify { expect(subject.ratelimit_used).to eq(nil) }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(42) }
  end

  context "with solar_system name" do
    before { VCR.insert_cassette "esi/search/solar_system" }

    after { VCR.eject_cassette }

    let(:client) { EveOnline::ESI::Client.new(token: token) }

    subject { client.search.search(id: 1_337_512_245, categories: ["solar_system"], search: "Tanoo") }

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

    specify { expect(subject.etag).to eq("\"7fa21c8cb4352a66e15fa7ef0cd5e855be2bcd79c178ecada25553bd\"") }

    specify { expect(subject.cache_status).to eq("MISS") }

    specify { expect(subject.request_id).to eq("dfd2cd58-b9bc-424e-b281-ae926023530f") }

    specify { expect(subject.ratelimit_group).to eq(nil) }

    specify { expect(subject.ratelimit_limit).to eq(nil) }

    specify { expect(subject.ratelimit_remaining).to eq(nil) }

    specify { expect(subject.ratelimit_used).to eq(nil) }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(41) }
  end

  context "with station name" do
    before { VCR.insert_cassette "esi/search/station" }

    after { VCR.eject_cassette }

    let(:client) { EveOnline::ESI::Client.new(token: token) }

    subject { client.search.search(id: 1_337_512_245, categories: ["station"], search: "Tanoo V - Moon 1 - Ammatar Consulate Bureau") }

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
        structure_ids: []
      )
    end

    specify { expect(subject.etag).to eq("\"ae0b5b3b05e2e59f305ae19e6edfb7a8ad4564a3281c3b7c7d1499c3\"") }

    specify { expect(subject.cache_status).to eq("MISS") }

    specify { expect(subject.request_id).to eq("4573998b-1783-41c4-8b8d-bcae8aab3e9f") }

    specify { expect(subject.ratelimit_group).to eq(nil) }

    specify { expect(subject.ratelimit_limit).to eq(nil) }

    specify { expect(subject.ratelimit_remaining).to eq(nil) }

    specify { expect(subject.ratelimit_used).to eq(nil) }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(41) }
  end

  context "with structure name" do
    # TODO: write example
  end

  context "with strict" do
    before { VCR.insert_cassette "esi/search/strict" }

    after { VCR.eject_cassette }

    let(:client) { EveOnline::ESI::Client.new(token: token) }

    subject { client.search.search(id: 1_337_512_245, categories: ["character"], search: "Johnn Dillinger", strict: true) }

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

    specify { expect(subject.etag).to eq("\"13042ed0cbc87ce8435a44a3c32c11d6710e54ca9f2b289d8722c92e\"") }

    specify { expect(subject.cache_status).to eq("MISS") }

    specify { expect(subject.request_id).to eq("56c48401-49b0-47c9-a61a-0b083260bd4c") }

    specify { expect(subject.ratelimit_group).to eq(nil) }

    specify { expect(subject.ratelimit_limit).to eq(nil) }

    specify { expect(subject.ratelimit_remaining).to eq(nil) }

    specify { expect(subject.ratelimit_used).to eq(nil) }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(40) }
  end
end

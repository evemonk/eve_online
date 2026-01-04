# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get corporation information" do
  let(:options) { {corporation_id: 98_468_592} }

  before { VCR.insert_cassette "esi/corporations/98468592_new" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.corporations.retrieve(id: 98_468_592) }

  specify do
    expect(subject.as_json).to eq(
      alliance_id: nil,
      ceo_id: 2_114_256_809,
      corporation_url: "https://zkillboard.com/corporation/98468592/",
      creator_id: 1_721_864_142,
      date_founded: "2016-07-11 14:22:17.000000000 +0000",
      description: "",
      faction_id: nil,
      home_station_id: 60_011_893,
      member_count: 12,
      name: "Bullshit Bingo Club",
      shares: 1000,
      tax_rate: 0.10000000149011612,
      ticker: "BUBIC",
      war_eligible: nil
    )
  end

  specify { expect(subject.etag).to eq('"ffbbcb2cd0c4ae79252e8244cd51b12a1d1810cbcd954813ccfa2467"') }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("2ed41162-8a52-4a9c-8d87-5d54f94f42d4") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(41) }
end

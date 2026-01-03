# frozen_string_literal: true

require "spec_helper"

describe "Get corporation information" do
  let(:options) { {corporation_id: 98_468_592} }

  before { VCR.insert_cassette "esi/corporations/98468592" }

  after { VCR.eject_cassette }

  subject { EveOnline::ESI::Corporation.new(options) }

  specify { expect(subject.scope).to eq(nil) }

  specify do
    expect(subject.as_json).to eq(alliance_id: 99_007_916,
      ceo_id: 1_721_864_142,
      corporation_url: "http://",
      creator_id: 1_721_864_142,
      date_founded: "2016-07-11 14:22:17.000000000 +0000",
      description: "",
      faction_id: nil,
      home_station_id: 60_011_893,
      member_count: 166,
      name: "Bullshit Bingo Club",
      shares: 1000,
      tax_rate: 0.1,
      ticker: "BUBIC",
      war_eligible: true)
  end

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(57) }
end

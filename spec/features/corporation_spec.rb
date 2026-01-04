# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get corporation information" do
  before { VCR.insert_cassette "esi/corporations/98468592" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.corporations.retrieve(id: 98_468_592) }

  specify do
    expect(subject.as_json).to eq(
      alliance_id: nil,
      ceo_id: 2_114_256_809,
      corporation_url: "https://zkillboard.com/corporation/98468592/",
      creator_id: 1_721_864_142,
      date_founded: Time.utc(2016, 7, 11, 14, 22, 17),
      description: "u'<font size=\"12\" color=\"#bfffffff\">BUBIC est malheureusement en hibernation !<br><br>En attendant un eventuel r\\xe9veil, retrouvez les anciens membres Bubic chez les chevres !   </font><font size=\"12\" color=\"#ffd98d00\"><a href=\"showinfo:2//98730717\">Goat to Go</a></font><font size=\"12\" color=\"#bfffffff\"> <br><br>Bon jeu et \\xe0 tr\\xe8s vite ... o7</font>'",
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

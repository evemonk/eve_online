# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get character's public information" do
  let(:options) { {character_id: 1_337_512_245} }

  before { VCR.insert_cassette "esi/characters/1337512245" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.characters.retrieve(id: 1_337_512_245) }

  specify do
    expect(subject.as_json).to eq(
      achievement_score: 0,
      alliance_id: nil,
      birthday: Time.utc(2010, 1, 15, 15, 26, 0),
      bloodline_id: 4,
      character_title_id: nil,
      corporation_id: 1_000_171,
      corporation_title: nil,
      description: "",
      faction_id: nil,
      gender: "male",
      name: "Johnn Dillinger",
      race_id: 2,
      security_status: 3.9
    )
  end

  specify { expect(subject.etag).to eq('W/"e2061437d3098a97a89c63c24714ac4e3c9ac90209e5e74e14d20469869b1e66"') }

  specify { expect(subject.cache_status).to eq("MISS") }

  specify { expect(subject.request_id).to eq(nil) }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(46) }
end

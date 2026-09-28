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
      corporation_id: 1_000_171,
      birthday: Time.utc(2010, 1, 15, 15, 26, 0),
      name: "Johnn Dillinger",
      gender: "male",
      race_id: 2,
      bloodline_id: 4,
      description: "",
      alliance_id: nil,
      security_status: 3.9,
      faction_id: nil,
      title: nil
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

# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get war information" do
  before { VCR.insert_cassette "esi/wars/744979" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.wars.war(war_id: 744_979) }

  specify do
    expect(subject.as_json).to eq(declared: Time.utc(2024, 10, 3, 11, 28, 0),
      finished: Time.utc(2024, 10, 7, 12, 6, 0),
      id: 744_979,
      mutual: false,
      open_for_allies: false,
      retracted: Time.utc(2024, 10, 6, 12, 6, 0),
      started: Time.utc(2024, 10, 4, 11, 28, 0))
  end

  specify do
    expect(subject.aggressor.as_json).to eq(alliance_id: 99_013_481,
      corporation_id: nil,
      isk_destroyed: 59_326_425.53,
      ships_killed: 3)
  end

  specify { expect(subject.allies.size).to eq(0) }

  # specify do
  #   expect(subject.allies.first.as_json).to eq(alliance_id: nil,
  #     corporation_id: 98_551_342)
  # end

  # specify do
  #   expect(subject.allies.last.as_json).to eq(alliance_id: 99_009_475,
  #     corporation_id: nil)
  # end

  specify do
    expect(subject.defender.as_json).to eq(alliance_id: 741_557_221,
      corporation_id: nil,
      isk_destroyed: 0.0,
      ships_killed: 0)
  end

  specify { expect(subject.etag).to eq("\"56a0cb7e82dc9ae8ace4cffe18236c3083a92a1e650372f9cfd2ee8a\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("bf760fc1-afb2-449b-9640-02cc8111e95d") }

  specify { expect(subject.ratelimit_group).to eq("killmail") }

  specify { expect(subject.ratelimit_limit).to eq("3600/15m") }

  specify { expect(subject.ratelimit_remaining).to eq(3_505) }

  specify { expect(subject.ratelimit_used).to eq(2) }

  specify { expect(subject.error_limit_remain).to eq(nil) }

  specify { expect(subject.error_limit_reset).to eq(nil) }
end

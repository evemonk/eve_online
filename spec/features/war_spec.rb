# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get war information" do
  before { VCR.insert_cassette "esi/wars/654019" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.wars.war(war_id: 654_019) }

  specify { expect(subject.scope).to eq(nil) }

  specify do
    expect(subject.as_json).to eq(declared: "2019-10-14 07:24:00.000000000 +0000",
      finished: "2019-10-23 11:42:00.000000000 +0000",
      mutual: false,
      open_for_allies: true,
      retracted: nil,
      started: "2019-10-15 07:24:00.000000000 +0000",
      war_id: 654_019)
  end

  specify do
    expect(subject.aggressor.as_json).to eq(alliance_id: nil,
      corporation_id: 98_616_186,
      isk_destroyed: 0.0,
      ships_killed: 0)
  end

  specify { expect(subject.allies.size).to eq(3) }

  specify do
    expect(subject.allies.first.as_json).to eq(alliance_id: nil,
      corporation_id: 98_551_342)
  end

  specify do
    expect(subject.allies.last.as_json).to eq(alliance_id: 99_009_475,
      corporation_id: nil)
  end

  specify do
    expect(subject.defender.as_json).to eq(alliance_id: nil,
      corporation_id: 98_616_479,
      isk_destroyed: 0.0,
      ships_killed: 0)
  end

  specify { expect(subject.etag).to eq(nil) }

  specify { expect(subject.cache_status).to eq("DYNAMIC") }

  specify { expect(subject.request_id).to eq(nil) }

  specify { expect(subject.ratelimit_group).to eq("routes") }

  specify { expect(subject.ratelimit_limit).to eq("3600/15m") }

  specify { expect(subject.ratelimit_remaining).to eq(3592) }

  specify { expect(subject.ratelimit_used).to eq(2) }

  specify { expect(subject.error_limit_remain).to eq(nil) }

  specify { expect(subject.error_limit_reset).to eq(nil) }
end

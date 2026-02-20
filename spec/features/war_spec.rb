# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get war information" do
  before { VCR.insert_cassette "esi/wars/654019" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.wars.war(war_id: 654_019) }

  specify do
    expect(subject.as_json).to eq(declared: "2019-10-14 07:24:00.000000000 +0000",
      finished: "2019-10-23 11:42:00.000000000 +0000",
      id: 654_019,
      mutual: false,
      open_for_allies: true,
      retracted: nil,
      started: "2019-10-15 07:24:00.000000000 +0000")
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

  specify { expect(subject.etag).to eq("\"8fc0e5b5553fc8620417a0104f64b66cc47fc22d8a6c57dc0f10a841\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("46f6be28-3d9a-4266-97e7-4db8f0ee330f") }

  specify { expect(subject.ratelimit_group).to eq("killmail") }

  specify { expect(subject.ratelimit_limit).to eq("3600/15m") }

  specify { expect(subject.ratelimit_remaining).to eq(3_594) }

  specify { expect(subject.ratelimit_used).to eq(2) }

  specify { expect(subject.error_limit_remain).to eq(nil) }

  specify { expect(subject.error_limit_reset).to eq(nil) }
end

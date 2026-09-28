# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get faction warfare character leaderboards" do
  before { VCR.insert_cassette "esi/faction_warfare/leaderboards/characters" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.faction_warfare.leaderboard_characters }

  specify { expect(subject.kills.active_total).to be_a(EveOnline::ESI::Collection) }

  specify { expect(subject.kills.active_total.first.as_json.keys).to contain_exactly(:amount, :character_id) }

  specify { expect(subject.etag).to eq("W/\"913b3f4e2ed35371bed5a2ddb54a29f6451d6062f85c3490634a33b0\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("bf587d24-efea-4513-9ac0-e11e1b08483f") }

  specify { expect(subject.ratelimit_group).to eq("factional-warfare") }

  specify { expect(subject.ratelimit_limit).to eq("150/15m") }

  specify { expect(subject.ratelimit_remaining).to eq(134) }

  specify { expect(subject.ratelimit_used).to eq(2) }

  specify { expect(subject.error_limit_remain).to eq(nil) }

  specify { expect(subject.error_limit_reset).to eq(nil) }
end

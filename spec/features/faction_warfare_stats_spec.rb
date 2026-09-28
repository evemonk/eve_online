# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get faction warfare statistics" do
  before { VCR.insert_cassette "esi/faction_warfare/stats" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.faction_warfare.stats }

  specify { expect(subject.size).to eq(6) }

  specify do
    expect(subject.first.as_json).to eq(faction_id: 500_001,
      pilots: 57_300,
      systems_controlled: 59)
  end

  specify do
    expect(subject.first.kills.as_json).to eq(last_week: 2497, total: 1_331_131, yesterday: 383)
  end

  specify do
    expect(subject.first.victory_points.as_json).to eq(last_week: 1_129_489, total: 215_603_178, yesterday: 156_606)
  end

  specify { expect(subject.etag).to eq("W/\"913b3f4e2ed35371bed5a2ddb54a29f6451d6062f85c3490634a33b0\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("ce398477-85b7-4403-88da-73efc91f47a0") }

  specify { expect(subject.ratelimit_group).to eq("factional-warfare") }

  specify { expect(subject.ratelimit_limit).to eq("150/15m") }

  specify { expect(subject.ratelimit_remaining).to eq(130) }

  specify { expect(subject.ratelimit_used).to eq(2) }

  specify { expect(subject.error_limit_remain).to eq(nil) }

  specify { expect(subject.error_limit_reset).to eq(nil) }
end

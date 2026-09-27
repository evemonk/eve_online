# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get faction warfare leaderboards" do
  before { VCR.insert_cassette "esi/faction_warfare/leaderboards" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.faction_warfare.leaderboards }

  specify { expect(subject.kills.active_total.size).to eq(4) }

  specify { expect(subject.kills.active_total.first.as_json).to eq(amount: 1_587_711, faction_id: 500_004) }

  specify { expect(subject.victory_points.yesterday.first.as_json).to eq(amount: 199_713, faction_id: 500_003) }
end

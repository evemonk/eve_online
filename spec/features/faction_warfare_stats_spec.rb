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
end

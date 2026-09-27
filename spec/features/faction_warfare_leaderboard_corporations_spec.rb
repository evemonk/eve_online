# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get faction warfare corporation leaderboards" do
  before { VCR.insert_cassette "esi/faction_warfare/leaderboards/corporations" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.faction_warfare.leaderboard_corporations }

  specify { expect(subject.kills.active_total).to be_a(EveOnline::ESI::Collection) }

  specify { expect(subject.kills.active_total.first.as_json.keys).to contain_exactly(:amount, :corporation_id) }
end

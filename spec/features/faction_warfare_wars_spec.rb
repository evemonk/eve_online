# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get factions at war" do
  before { VCR.insert_cassette "esi/faction_warfare/wars" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.faction_warfare.wars }

  specify { expect(subject.size).to eq(12) }

  specify { expect(subject.first.as_json).to eq(against_id: 500_004, faction_id: 500_001) }
end

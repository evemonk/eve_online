# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get sovereignty systems" do
  before { VCR.insert_cassette "esi/sovereignty/systems" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.sovereignty.systems }

  specify { expect(subject.solar_systems.size).to eq(5485) }

  specify do
    expect(subject.solar_systems.first.as_json).to eq(claim: {"faction" => {"faction_id" => 500_007}},
      solar_system_id: 30_000_001)
  end
end

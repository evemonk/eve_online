# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get raidable skyhooks" do
  before { VCR.insert_cassette "esi/activities/skyhooks_raidable" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.activities.raidable_skyhooks }

  specify { expect(subject.skyhooks).to be_a(EveOnline::ESI::Collection) }

  specify do
    expect(subject.skyhooks.first.as_json).to eq(planet_id: 40_281_991, solar_system_id: 30_004_455)
  end

  specify do
    vulnerability = subject.skyhooks.first.theft_vulnerability

    expect(vulnerability.as_json).to eq(end: Time.utc(2026, 9, 27, 22, 35, 29),
      start: Time.utc(2026, 9, 27, 20, 35, 29))
  end
end

# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get industry facilities" do
  before { VCR.insert_cassette "esi/industry/facilities" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.industry.facilities }

  specify { expect(subject.size).to eq(2321) }

  specify do
    expect(subject.first.as_json).to eq(facility_id: 60_006_400,
      owner_id: 1_000_065,
      region_id: 10_000_043,
      solar_system_id: 30_003_488,
      tax: nil,
      type_id: 1928)
  end
end

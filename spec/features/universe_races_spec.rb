# frozen_string_literal: true

require "spec_helper"

describe "Get character races" do
  before { VCR.insert_cassette "esi/universe/races" }

  after { VCR.eject_cassette }

  subject { EveOnline::ESI::UniverseRaces.new }

  specify { expect(subject.scope).to eq(nil) }

  specify { expect(subject.races.size).to eq(6) }

  specify do
    expect(subject.races.first.as_json).to eq(faction_id: 500_001,
      description: "Founded on the tenets of patriotism and hard work that carried its ancestors through hardships on an inhospitable homeworld, the Caldari State is today a corporate dictatorship, led by rulers who are determined to see it return to the meritocratic ideals of old. Ruthless and efficient in the boardroom as well as on the battlefield, the Caldari are living emblems of strength, persistence, and dignity.",
      name: "Caldari",
      id: 1)
  end

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(10) }
end

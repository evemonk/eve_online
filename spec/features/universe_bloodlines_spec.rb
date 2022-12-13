# frozen_string_literal: true

require "spec_helper"

describe "Get bloodlines" do
  before { VCR.insert_cassette "esi/universe/bloodlines" }

  after { VCR.eject_cassette }

  subject { EveOnline::ESI::UniverseBloodlines.new }

  specify { expect(subject.scope).to eq(nil) }

  specify { expect(subject.bloodlines.size).to eq(18) }

  specify do
    expect(subject.bloodlines.first.as_json).to eq(bloodline_id: 1,
      charisma: 6,
      corporation_id: 1_000_006,
      description: "The Deteis are regarded as the face of leadership in Caldari society. Commonly possessed of sharp, ordered minds and articulate tongues, they are mostly found in positions of authority within military and political spheres. Driven by the cultural premise that the good of the whole must come before the needs of the individual, they have made the responsibility of upholding the integrity of the entire Caldari State their own.",
      intelligence: 7,
      memory: 7,
      name: "Deteis",
      perception: 5,
      race_id: 1,
      ship_type_id: 601,
      willpower: 5)
  end

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(44) }
end

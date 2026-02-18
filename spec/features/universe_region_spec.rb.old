# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get region information" do
  before { VCR.insert_cassette "esi/universe/regions/10000001" }

  after { VCR.eject_cassette }

  let(:options) { {id: 10_000_001} }

  subject { EveOnline::ESI::UniverseRegion.new(options) }

  specify { expect(subject.scope).to eq(nil) }

  specify do
    expect(subject.as_json).to eq(description: "The Derelik region, sovereign seat of the Ammatar Mandate, became the shield to the Amarrian flank in the wake of the Minmatar Rebellion. Derelik witnessed many hostile exchanges between the Amarr and rebel forces as the latter tried to push deeper into the territory of their former masters. Having held their ground, thanks in no small part to the Ammatars' military efforts, the Amarr awarded the Ammatar with their own province. However, this portion of space shared borders with the newly forming Minmatar Republic as well as the Empire, and thus came to be situated in a dark recess surrounded by hostiles. \n\nGiven the lack of safe routes elsewhere, the local economies of this region were dependent on trade with the Amarr as their primary means of survival. The Ammatar persevered over many decades of economic stagnation and limited trade partners, and their determination has in recent decades been rewarded with an increase in economic prosperity. This harsh trail is a point of pride for all who call themselves Ammatar, and it has bolstered their faith in the Amarrian way to no end.",
      name: "Derelik",
      region_id: 10_000_001)
  end

  specify { expect(subject.constellation_ids.size).to eq(16) }

  specify { expect(subject.constellation_ids.first).to eq(20_000_001) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(40) }
end

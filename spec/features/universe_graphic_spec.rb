# frozen_string_literal: true

require "spec_helper"

describe "Get graphic information" do
  before { VCR.insert_cassette "esi/universe/graphics/20481" }

  after { VCR.eject_cassette }

  let(:options) { {id: 20_481} }

  subject { EveOnline::ESI::UniverseGraphic.new(options) }

  specify { expect(subject.scope).to eq(nil) }

  specify do
    expect(subject.as_json).to eq(collision_file: nil,
      graphic_file: nil,
      graphic_id: 20_481,
      icon_folder: nil,
      sof_dna: "ai1_t1:tash-murkon:amarr",
      sof_fation_name: "tash-murkon",
      sof_hull_name: "ai1_t1",
      sof_race_name: "amarr")
  end

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(22) }
end

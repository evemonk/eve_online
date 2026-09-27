# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get schematic information" do
  before { VCR.insert_cassette "esi/planetary_interaction/schematics/65" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.planetary_interaction.schematic(id: 65) }

  specify { expect(subject.as_json).to eq(cycle_time: 3600, schematic_name: "Superconductors") }
end

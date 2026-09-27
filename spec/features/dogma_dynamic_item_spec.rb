# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get dynamic item information" do
  before { VCR.insert_cassette "esi/dogma/dynamic_items/49734/1055447532024" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.dogma.dynamic_item(type_id: 49_734, item_id: 1_055_447_532_024) }

  specify do
    expect(subject.as_json).to eq(created_by: 2_124_014_413,
      mutator_type_id: 49_737,
      source_type_id: 47_911)
  end

  specify { expect(subject.dogma_attributes.size).to eq(13) }

  specify { expect(subject.dogma_attributes.first.as_json).to eq(attribute_id: 64, value: 1.1507467802143097) }

  specify { expect(subject.dogma_effects.size).to eq(4) }

  specify { expect(subject.dogma_effects.first.as_json).to eq(effect_id: 11, is_default: false) }
end

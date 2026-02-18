# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get effect information" do
  before { VCR.insert_cassette "esi/dogma/effects/6717" }

  after { VCR.eject_cassette }

  let(:options) { {id: 6717} }

  subject { EveOnline::ESI::DogmaEffect.new(options) }

  specify { expect(subject.scope).to eq(nil) }

  specify do
    expect(subject.as_json).to eq(description: "Automatically generated effect",
      disallow_auto_repeat: nil,
      discharge_attribute_id: nil,
      display_name: "",
      duration_attribute_id: nil,
      effect_category: 0,
      effect_id: 6717,
      electronic_chance: nil,
      falloff_attribute_id: nil,
      icon_id: nil,
      is_assistance: nil,
      is_offensive: nil,
      is_warp_safe: nil,
      name: "roleBonusIceOreMiningDurationCap",
      post_expression: 19_291,
      pre_expression: 19_290,
      published: nil,
      range_attribute_id: nil,
      range_chance: nil,
      tracking_speed_attribute_id: nil)
  end

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(28) }
end

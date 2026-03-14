# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get effect information" do
  before { VCR.insert_cassette "esi/dogma/effects/6717" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.dogma.effect(id: 6_717) }

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
      post_expression: nil,
      pre_expression: nil,
      published: nil,
      range_attribute_id: nil,
      range_chance: nil,
      tracking_speed_attribute_id: nil)
  end

  specify { expect(subject.modifiers.size).to eq(4) }

  specify do
    expect(subject.modifiers.first.as_json).to eq(domain: "shipID",
      effect_id: nil,
      func: "LocationRequiredSkillModifier",
      modified_attribute_id: 73,
      modifying_attribute_id: 2_458,
      operator: 6)
  end

  specify { expect(subject.etag).to eq("W/\"eb02b32cba3ed2b28639d4d552243949671a18d2b8aca54f4271cfbb\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("186c1667-ac1e-4b70-ba58-d732fe508345") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(41) }
end

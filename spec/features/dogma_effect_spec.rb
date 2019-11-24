# frozen_string_literal: true

require "spec_helper"

describe "Get effect information" do
  context "when etag not set" do
    before { VCR.insert_cassette "esi/dogma/effects/6717" }

    after { VCR.eject_cassette }

    let(:options) { {id: 6717} }

    subject { EveOnline::ESI::DogmaEffect.new(options) }

    specify { expect(subject.scope).to eq(nil) }

    specify { expect(subject.not_modified?).to eq(false) }

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

    specify { expect(subject.etag).to eq("acc1e563574a55f79ebe4a2a99845dd6c28f4e412e11fd084b8485fd") }
  end

  context "when etag is set" do
    before { VCR.insert_cassette "esi/dogma/effects/6717_with_etag" }

    after { VCR.eject_cassette }

    let(:options) do
      {
        id: 6717,
        etag: "acc1e563574a55f79ebe4a2a99845dd6c28f4e412e11fd084b8485fd",
      }
    end

    subject { EveOnline::ESI::DogmaEffect.new(options) }

    specify { expect(subject.not_modified?).to eq(true) }

    specify { expect(subject.etag).to eq("acc1e563574a55f79ebe4a2a99845dd6c28f4e412e11fd084b8485fd") }
  end
end

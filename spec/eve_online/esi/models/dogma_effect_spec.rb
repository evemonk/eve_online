# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::DogmaEffect do
  it { should be_a(EveOnline::ESI::Models::Base) }

  let(:options) { double }

  subject { described_class.new(options) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#as_json" do
    let(:dogma_effect) { described_class.new(options) }

    let(:disallow_auto_repeat) { double }

    let(:discharge_attribute_id) { double }

    let(:duration_attribute_id) { double }

    let(:electronic_chance) { double }

    let(:falloff_attribute_id) { double }

    let(:icon_id) { double }

    let(:is_assistance) { double }

    let(:is_offensive) { double }

    let(:is_warp_safe) { double }

    let(:published) { double }

    let(:range_attribute_id) { double }

    let(:range_chance) { double }

    let(:tracking_speed_attribute_id) { double }

    before { expect(dogma_effect).to receive(:description).and_return("Automatically generated effect") }

    before { expect(dogma_effect).to receive(:disallow_auto_repeat).and_return(disallow_auto_repeat) }

    before { expect(dogma_effect).to receive(:discharge_attribute_id).and_return(discharge_attribute_id) }

    before { expect(dogma_effect).to receive(:display_name).and_return("") }

    before { expect(dogma_effect).to receive(:duration_attribute_id).and_return(duration_attribute_id) }

    before { expect(dogma_effect).to receive(:effect_category).and_return(0) }

    before { expect(dogma_effect).to receive(:effect_id).and_return(6717) }

    before { expect(dogma_effect).to receive(:electronic_chance).and_return(electronic_chance) }

    before { expect(dogma_effect).to receive(:falloff_attribute_id).and_return(falloff_attribute_id) }

    before { expect(dogma_effect).to receive(:icon_id).and_return(icon_id) }

    before { expect(dogma_effect).to receive(:is_assistance).and_return(is_assistance) }

    before { expect(dogma_effect).to receive(:is_offensive).and_return(is_offensive) }

    before { expect(dogma_effect).to receive(:is_warp_safe).and_return(is_warp_safe) }

    before { expect(dogma_effect).to receive(:name).and_return("roleBonusIceOreMiningDurationCap") }

    before { expect(dogma_effect).to receive(:post_expression).and_return(19_291) }

    before { expect(dogma_effect).to receive(:pre_expression).and_return(19_290) }

    before { expect(dogma_effect).to receive(:published).and_return(published) }

    before { expect(dogma_effect).to receive(:range_attribute_id).and_return(range_attribute_id) }

    before { expect(dogma_effect).to receive(:range_chance).and_return(range_chance) }

    before { expect(dogma_effect).to receive(:tracking_speed_attribute_id).and_return(tracking_speed_attribute_id) }

    subject { dogma_effect.as_json }

    its([:description]) { should eq("Automatically generated effect") }

    its([:disallow_auto_repeat]) { should eq(disallow_auto_repeat) }

    its([:discharge_attribute_id]) { should eq(discharge_attribute_id) }

    its([:display_name]) { should eq("") }

    its([:duration_attribute_id]) { should eq(duration_attribute_id) }

    its([:effect_category]) { should eq(0) }

    its([:effect_id]) { should eq(6717) }

    its([:electronic_chance]) { should eq(electronic_chance) }

    its([:falloff_attribute_id]) { should eq(falloff_attribute_id) }

    its([:icon_id]) { should eq(icon_id) }

    its([:is_assistance]) { should eq(is_assistance) }

    its([:is_offensive]) { should eq(is_offensive) }

    its([:is_warp_safe]) { should eq(is_warp_safe) }

    its([:name]) { should eq("roleBonusIceOreMiningDurationCap") }

    its([:post_expression]) { should eq(19_291) }

    its([:pre_expression]) { should eq(19_290) }

    its([:published]) { should eq(published) }

    its([:range_attribute_id]) { should eq(range_attribute_id) }

    its([:range_chance]) { should eq(range_chance) }

    its([:tracking_speed_attribute_id]) { should eq(tracking_speed_attribute_id) }
  end

  describe "#description" do
    before { expect(options).to receive(:[]).with("description") }

    specify { expect { subject.description }.not_to raise_error }
  end

  describe "#disallow_auto_repeat" do
    before { expect(options).to receive(:[]).with("disallow_auto_repeat") }

    specify { expect { subject.disallow_auto_repeat }.not_to raise_error }
  end

  describe "#discharge_attribute_id" do
    before { expect(options).to receive(:[]).with("discharge_attribute_id") }

    specify { expect { subject.discharge_attribute_id }.not_to raise_error }
  end

  describe "#display_name" do
    before { expect(options).to receive(:[]).with("display_name") }

    specify { expect { subject.display_name }.not_to raise_error }
  end

  describe "#duration_attribute_id" do
    before { expect(options).to receive(:[]).with("duration_attribute_id") }

    specify { expect { subject.duration_attribute_id }.not_to raise_error }
  end

  describe "#effect_category" do
    before { expect(options).to receive(:[]).with("effect_category") }

    specify { expect { subject.effect_category }.not_to raise_error }
  end

  describe "#effect_id" do
    before { expect(options).to receive(:[]).with("effect_id") }

    specify { expect { subject.effect_id }.not_to raise_error }
  end

  describe "#electronic_chance" do
    before { expect(options).to receive(:[]).with("electronic_chance") }

    specify { expect { subject.electronic_chance }.not_to raise_error }
  end

  describe "#falloff_attribute_id" do
    before { expect(options).to receive(:[]).with("falloff_attribute_id") }

    specify { expect { subject.falloff_attribute_id }.not_to raise_error }
  end

  describe "#falloff_attribute_id" do
    before { expect(options).to receive(:[]).with("falloff_attribute_id") }

    specify { expect { subject.falloff_attribute_id }.not_to raise_error }
  end

  describe "#icon_id" do
    before { expect(options).to receive(:[]).with("icon_id") }

    specify { expect { subject.icon_id }.not_to raise_error }
  end

  describe "#is_assistance" do
    before { expect(options).to receive(:[]).with("is_assistance") }

    specify { expect { subject.is_assistance }.not_to raise_error }
  end

  describe "#is_offensive" do
    before { expect(options).to receive(:[]).with("is_offensive") }

    specify { expect { subject.is_offensive }.not_to raise_error }
  end

  describe "#is_warp_safe" do
    before { expect(options).to receive(:[]).with("is_warp_safe") }

    specify { expect { subject.is_warp_safe }.not_to raise_error }
  end

  describe "#name" do
    before { expect(options).to receive(:[]).with("name") }

    specify { expect { subject.name }.not_to raise_error }
  end

  describe "#post_expression" do
    before { expect(options).to receive(:[]).with("post_expression") }

    specify { expect { subject.post_expression }.not_to raise_error }
  end

  describe "#pre_expression" do
    before { expect(options).to receive(:[]).with("pre_expression") }

    specify { expect { subject.pre_expression }.not_to raise_error }
  end

  describe "#published" do
    before { expect(options).to receive(:[]).with("published") }

    specify { expect { subject.published }.not_to raise_error }
  end

  describe "#range_attribute_id" do
    before { expect(options).to receive(:[]).with("range_attribute_id") }

    specify { expect { subject.range_attribute_id }.not_to raise_error }
  end

  describe "#range_chance" do
    before { expect(options).to receive(:[]).with("range_chance") }

    specify { expect { subject.range_chance }.not_to raise_error }
  end

  describe "#tracking_speed_attribute_id" do
    before { expect(options).to receive(:[]).with("tracking_speed_attribute_id") }

    specify { expect { subject.tracking_speed_attribute_id }.not_to raise_error }
  end

  describe "#modifiers" do
    context "when @modifiers set" do
      let(:modifiers) { double }

      before { subject.instance_variable_set(:@modifiers, modifiers) }

      specify { expect(subject.modifiers).to eq(modifiers) }
    end

    context "when @modifiers not set" do
      let(:option) { double }

      let(:options) { {"modifiers" => option} }

      let(:dogma_effect_modifiers) { instance_double(EveOnline::ESI::Models::DogmaEffectModifiers) }

      let(:collection) { double }

      before { expect(EveOnline::ESI::Models::DogmaEffectModifiers).to receive(:new).with(option).and_return(dogma_effect_modifiers) }

      before { expect(dogma_effect_modifiers).to receive(:modifiers).and_return(collection) }

      specify { expect { subject.modifiers }.not_to raise_error }

      specify { expect { subject.modifiers }.to change { subject.instance_variable_get(:@modifiers) }.from(nil).to(collection) }
    end
  end
end

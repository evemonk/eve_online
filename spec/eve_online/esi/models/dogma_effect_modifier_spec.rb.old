# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::DogmaEffectModifier do
  it { should be_a(EveOnline::ESI::Models::Base) }

  let(:options) { double }

  subject { described_class.new(options) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#as_json" do
    let(:dogma_effect_modifier) { described_class.new(options) }

    let(:effect_id) { double }

    before { expect(dogma_effect_modifier).to receive(:domain).and_return("shipID") }

    before { expect(dogma_effect_modifier).to receive(:effect_id).and_return(effect_id) }

    before { expect(dogma_effect_modifier).to receive(:func).and_return("LocationRequiredSkillModifier") }

    before { expect(dogma_effect_modifier).to receive(:modified_attribute_id).and_return(73) }

    before { expect(dogma_effect_modifier).to receive(:modifying_attribute_id).and_return(2458) }

    before { expect(dogma_effect_modifier).to receive(:operator).and_return(6) }

    subject { dogma_effect_modifier.as_json }

    its([:domain]) { should eq("shipID") }

    its([:effect_id]) { should eq(effect_id) }

    its([:func]) { should eq("LocationRequiredSkillModifier") }

    its([:modified_attribute_id]) { should eq(73) }

    its([:modifying_attribute_id]) { should eq(2458) }

    its([:operator]) { should eq(6) }
  end

  describe "#domain" do
    before { expect(options).to receive(:[]).with("domain") }

    specify { expect { subject.domain }.not_to raise_error }
  end

  describe "#effect_id" do
    before { expect(options).to receive(:[]).with("effect_id") }

    specify { expect { subject.effect_id }.not_to raise_error }
  end

  describe "#func" do
    before { expect(options).to receive(:[]).with("func") }

    specify { expect { subject.func }.not_to raise_error }
  end

  describe "#modified_attribute_id" do
    before { expect(options).to receive(:[]).with("modified_attribute_id") }

    specify { expect { subject.modified_attribute_id }.not_to raise_error }
  end

  describe "#modifying_attribute_id" do
    before { expect(options).to receive(:[]).with("modifying_attribute_id") }

    specify { expect { subject.modifying_attribute_id }.not_to raise_error }
  end

  describe "#operator" do
    before { expect(options).to receive(:[]).with("operator") }

    specify { expect { subject.operator }.not_to raise_error }
  end
end

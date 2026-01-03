# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::DogmaEffectModifiers do
  it { should be_a(EveOnline::ESI::Models::Base) }

  let(:options) { double }

  subject { described_class.new(options) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#dogma_effects" do
    context "when options is array" do
      let(:dogma_effect_modifier) { double }

      let(:option) { double }

      let(:options) { [option] }

      before { expect(EveOnline::ESI::Models::DogmaEffectModifier).to receive(:new).with(option).and_return(dogma_effect_modifier) }

      specify { expect(subject.modifiers).to eq([dogma_effect_modifier]) }
    end

    context "when options is nil" do
      let(:options) { nil }

      specify { expect(subject.modifiers).to eq([]) }
    end
  end
end

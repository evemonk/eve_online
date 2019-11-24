# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::DogmaEffects do
  it { should be_a(EveOnline::ESI::Models::Base) }

  let(:options) { double }

  subject { described_class.new(options) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#dogma_effects" do
    context "when options is array" do
      let(:dogma_effect_short) { double }

      let(:option) { double }

      let(:options) { [option] }

      before { expect(EveOnline::ESI::Models::DogmaEffectShort).to receive(:new).with(option).and_return(dogma_effect_short) }

      before { expect(subject.dogma_effects).to eq([dogma_effect_short]) }
    end

    context "when options is nil" do
      let(:options) { nil }

      before { expect(subject.dogma_effects).to eq([]) }
    end
  end
end

# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::DogmaEffectShort do
  it { should be_a(EveOnline::ESI::Models::Base) }

  let(:options) { double }

  subject { described_class.new(options) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#as_json" do
    let(:dogma_effect_short) { described_class.new(options) }

    before { expect(dogma_effect_short).to receive(:effect_id).and_return(596) }

    before { expect(dogma_effect_short).to receive(:is_default).and_return(false) }

    subject { dogma_effect_short.as_json }

    its([:effect_id]) { should eq(596) }

    its([:is_default]) { should eq(false) }
  end

  describe "#effect_id" do
    before { expect(options).to receive(:[]).with("effect_id") }

    specify { expect { subject.effect_id }.not_to raise_error }
  end

  describe "#is_default" do
    before { expect(options).to receive(:[]).with("is_default") }

    specify { expect { subject.is_default }.not_to raise_error }
  end
end

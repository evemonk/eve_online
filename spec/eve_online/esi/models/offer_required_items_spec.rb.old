# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::OfferRequiredItems do
  it { should be_a(EveOnline::ESI::Models::Base) }

  let(:options) { double }

  subject { described_class.new(options) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#offer_required_items" do
    context "when options is array" do
      let(:offer_required_item) { double }

      let(:option) { double }

      let(:options) { [option] }

      before { expect(EveOnline::ESI::Models::DogmaEffectShort).to receive(:new).with(option).and_return(offer_required_item) }

      before { expect(subject.offer_required_items).to eq([offer_required_item]) }
    end

    context "when options is nil" do
      let(:options) { nil }

      before { expect(subject.offer_required_items).to eq([]) }
    end
  end
end

# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::DogmaAttributes do
  it { should be_a(EveOnline::ESI::Models::Base) }

  let(:options) { double }

  subject { described_class.new(options) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#dogma_attributes" do
    context "when options is array" do
      let(:dogma_attribute_short) { double }

      let(:option) { double }

      let(:options) { [option] }

      before { expect(DogmaAttributeShort).to receive(:new).with(option).and_return(dogma_attribute_short) }

      before { expect(subject.dogma_attributes).to eq([dogma_attribute_short]) }
    end

    context "when options is nil" do
      let(:options) { nil }

      before { expect(subject.dogma_attributes).to eq([]) }
    end
  end
end

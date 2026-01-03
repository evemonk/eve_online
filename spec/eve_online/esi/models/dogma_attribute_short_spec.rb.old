# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::DogmaAttributeShort do
  it { should be_a(EveOnline::ESI::Models::Base) }

  let(:options) { double }

  subject { described_class.new(options) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#as_json" do
    let(:dogma_attribute_short) { described_class.new(options) }

    before { expect(dogma_attribute_short).to receive(:attribute_id).and_return(128) }

    before { expect(dogma_attribute_short).to receive(:value).and_return(2.0) }

    subject { dogma_attribute_short.as_json }

    its([:attribute_id]) { should eq(128) }

    its([:value]) { should eq(2.0) }
  end

  describe "#attribute_id" do
    before { expect(options).to receive(:[]).with("attribute_id") }

    specify { expect { subject.attribute_id }.not_to raise_error }
  end

  describe "#value" do
    before { expect(options).to receive(:[]).with("value") }

    specify { expect { subject.value }.not_to raise_error }
  end
end

# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::DogmaAttribute do
  it { should be_a(EveOnline::ESI::Models::Base) }

  let(:options) { double }

  subject { described_class.new(options) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#as_json" do
    let(:dogma_attribute) { described_class.new(options) }

    let(:icon_id) { double }

    let(:published) { double }

    let(:unit_id) { double }

    before { expect(dogma_attribute).to receive(:attribute_id).and_return(2) }

    before { expect(dogma_attribute).to receive(:default_value).and_return(0.0) }

    before { expect(dogma_attribute).to receive(:description).and_return("Boolean to store status of online effect") }

    before { expect(dogma_attribute).to receive(:display_name).and_return("") }

    before { expect(dogma_attribute).to receive(:high_is_good).and_return(true) }

    before { expect(dogma_attribute).to receive(:icon_id).and_return(icon_id) }

    before { expect(dogma_attribute).to receive(:name).and_return("isOnline") }

    before { expect(dogma_attribute).to receive(:published).and_return(published) }

    before { expect(dogma_attribute).to receive(:stackable).and_return(true) }

    before { expect(dogma_attribute).to receive(:unit_id).and_return(unit_id) }

    subject { dogma_attribute.as_json }

    its([:attribute_id]) { should eq(2) }

    its([:default_value]) { should eq(0.0) }

    its([:description]) { should eq("Boolean to store status of online effect") }

    its([:display_name]) { should eq("") }

    its([:high_is_good]) { should eq(true) }

    its([:icon_id]) { should eq(icon_id) }

    its([:name]) { should eq("isOnline") }

    its([:published]) { should eq(published) }

    its([:stackable]) { should eq(true) }

    its([:unit_id]) { should eq(unit_id) }
  end

  describe "#attribute_id" do
    before { expect(options).to receive(:[]).with("attribute_id") }

    specify { expect { subject.attribute_id }.not_to raise_error }
  end

  describe "#default_value" do
    before { expect(options).to receive(:[]).with("default_value") }

    specify { expect { subject.default_value }.not_to raise_error }
  end

  describe "#description" do
    before { expect(options).to receive(:[]).with("description") }

    specify { expect { subject.description }.not_to raise_error }
  end

  describe "#display_name" do
    before { expect(options).to receive(:[]).with("display_name") }

    specify { expect { subject.display_name }.not_to raise_error }
  end

  describe "#high_is_good" do
    before { expect(options).to receive(:[]).with("high_is_good") }

    specify { expect { subject.high_is_good }.not_to raise_error }
  end

  describe "#icon_id" do
    before { expect(options).to receive(:[]).with("icon_id") }

    specify { expect { subject.icon_id }.not_to raise_error }
  end

  describe "#name" do
    before { expect(options).to receive(:[]).with("name") }

    specify { expect { subject.name }.not_to raise_error }
  end

  describe "#published" do
    before { expect(options).to receive(:[]).with("published") }

    specify { expect { subject.published }.not_to raise_error }
  end

  describe "#stackable" do
    before { expect(options).to receive(:[]).with("stackable") }

    specify { expect { subject.stackable }.not_to raise_error }
  end

  describe "#unit_id" do
    before { expect(options).to receive(:[]).with("unit_id") }

    specify { expect { subject.unit_id }.not_to raise_error }
  end
end

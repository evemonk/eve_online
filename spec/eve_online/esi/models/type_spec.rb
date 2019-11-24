# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::Type do
  let(:options) { double }

  subject { described_class.new(options) }

  it { should be_a(EveOnline::ESI::Models::Base) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#as_json" do
    let(:type) { described_class.new(options) }

    before { expect(type).to receive(:capacity).and_return(0) }

    before { expect(type).to receive(:description).and_return("Medium Projectile Ammo...") }

    before { expect(type).to receive(:graphic_id).and_return(1297) }

    before { expect(type).to receive(:group_id).and_return(83) }

    before { expect(type).to receive(:icon_id).and_return(1297) }

    before { expect(type).to receive(:market_group_id).and_return(112) }

    before { expect(type).to receive(:mass).and_return(1) }

    before { expect(type).to receive(:name).and_return("Phased Plasma M") }

    before { expect(type).to receive(:packaged_volume).and_return(0.0125) }

    before { expect(type).to receive(:portion_size).and_return(100) }

    before { expect(type).to receive(:published).and_return(true) }

    before { expect(type).to receive(:radius).and_return(1) }

    before { expect(type).to receive(:type_id).and_return(192) }

    before { expect(type).to receive(:volume).and_return(0.0125) }

    subject { type.as_json }

    its([:capacity]) { should eq(0) }

    its([:description]) { should eq("Medium Projectile Ammo...") }

    its([:graphic_id]) { should eq(1297) }

    its([:group_id]) { should eq(83) }

    its([:icon_id]) { should eq(1297) }

    its([:market_group_id]) { should eq(112) }

    its([:mass]) { should eq(1) }

    its([:name]) { should eq("Phased Plasma M") }

    its([:packaged_volume]) { should eq(0.0125) }

    its([:portion_size]) { should eq(100) }

    its([:published]) { should eq(true) }

    its([:radius]) { should eq(1) }

    its([:type_id]) { should eq(192) }

    its([:volume]) { should eq(0.0125) }
  end

  describe "#capacity" do
    before { expect(options).to receive(:[]).with("capacity") }

    specify { expect { subject.capacity }.not_to raise_error }
  end

  describe "#description" do
    before { expect(options).to receive(:[]).with("description") }

    specify { expect { subject.description }.not_to raise_error }
  end

  describe "#graphic_id" do
    before { expect(options).to receive(:[]).with("graphic_id") }

    specify { expect { subject.graphic_id }.not_to raise_error }
  end

  describe "#group_id" do
    before { expect(options).to receive(:[]).with("group_id") }

    specify { expect { subject.group_id }.not_to raise_error }
  end

  describe "#icon_id" do
    before { expect(options).to receive(:[]).with("icon_id") }

    specify { expect { subject.icon_id }.not_to raise_error }
  end

  describe "#market_group_id" do
    before { expect(options).to receive(:[]).with("market_group_id") }

    specify { expect { subject.market_group_id }.not_to raise_error }
  end

  describe "#mass" do
    before { expect(options).to receive(:[]).with("mass") }

    specify { expect { subject.mass }.not_to raise_error }
  end

  describe "#name" do
    before { expect(options).to receive(:[]).with("name") }

    specify { expect { subject.name }.not_to raise_error }
  end

  describe "#packaged_volume" do
    before { expect(options).to receive(:[]).with("packaged_volume") }

    specify { expect { subject.packaged_volume }.not_to raise_error }
  end

  describe "#portion_size" do
    before { expect(options).to receive(:[]).with("portion_size") }

    specify { expect { subject.portion_size }.not_to raise_error }
  end

  describe "#published" do
    before { expect(options).to receive(:[]).with("published") }

    specify { expect { subject.published }.not_to raise_error }
  end

  describe "#radius" do
    before { expect(options).to receive(:[]).with("radius") }

    specify { expect { subject.radius }.not_to raise_error }
  end

  describe "#type_id" do
    before { expect(options).to receive(:[]).with("type_id") }

    specify { expect { subject.type_id }.not_to raise_error }
  end

  describe "#volume" do
    before { expect(options).to receive(:[]).with("volume") }

    specify { expect { subject.volume }.not_to raise_error }
  end

  describe "#dogma_attributes" do
    context "when @dogma_attributes set" do
      let(:dogma_attributes) { double }

      before { subject.instance_variable_set(:@dogma_attributes, dogma_attributes) }

      specify { expect(subject.dogma_attributes).to eq(dogma_attributes) }
    end

    context "when @dogma_attributes not set" do
      let(:option) { double }

      let(:options) { {"dogma_attributes" => option} }

      let(:dogma_attributes) { instance_double(EveOnline::ESI::Models::DogmaAttributes) }

      let(:output) { double }

      before { expect(EveOnline::ESI::Models::DogmaAttributes).to receive(:new).with(option).and_return(dogma_attributes) }

      before { expect(dogma_attributes).to receive(:dogma_attributes).and_return(output) }

      specify { expect { subject.dogma_attributes }.not_to raise_error }

      specify { expect { subject.dogma_attributes }.to change { subject.instance_variable_get(:@dogma_attributes) }.from(nil).to(output) }
    end
  end

  describe "#dogma_effects" do
    context "when @dogma_effects set" do
      let(:dogma_effects) { double }

      before { subject.instance_variable_set(:@dogma_effects, dogma_effects) }

      specify { expect(subject.dogma_effects).to eq(dogma_effects) }
    end

    context "when @dogma_effects not set" do
      let(:option) { double }

      let(:options) { {"dogma_effects" => option} }

      let(:dogma_effects) { instance_double(EveOnline::ESI::Models::DogmaEffects) }

      let(:output) { double }

      before { expect(EveOnline::ESI::Models::DogmaEffects).to receive(:new).with(option).and_return(dogma_effects) }

      before { expect(dogma_effects).to receive(:dogma_effects).and_return(output) }

      specify { expect { subject.dogma_effects }.not_to raise_error }

      specify { expect { subject.dogma_effects }.to change { subject.instance_variable_get(:@dogma_effects) }.from(nil).to(output) }
    end
  end
end

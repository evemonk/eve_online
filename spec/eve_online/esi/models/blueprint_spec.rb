# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::Blueprint do
  it { should be_a(EveOnline::ESI::Models::Base) }

  let(:options) { double }

  subject { described_class.new(options) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#as_json" do
    let(:blueprint) { described_class.new(options) }

    before { expect(blueprint).to receive(:item_id).and_return(716_338_097) }

    before { expect(blueprint).to receive(:location_flag).and_return("Hangar") }

    before { expect(blueprint).to receive(:location_id).and_return(61_000_032) }

    before { expect(blueprint).to receive(:material_efficiency).and_return(10) }

    before { expect(blueprint).to receive(:quantity).and_return(-2) }

    before { expect(blueprint).to receive(:runs).and_return(300) }

    before { expect(blueprint).to receive(:time_efficiency).and_return(0) }

    before { expect(blueprint).to receive(:type_id).and_return(1010) }

    subject { blueprint.as_json }

    its([:item_id]) { should eq(716_338_097) }

    its([:location_flag]) { should eq("Hangar") }

    its([:location_id]) { should eq(61_000_032) }

    its([:material_efficiency]) { should eq(10) }

    its([:quantity]) { should eq(-2) }

    its([:runs]) { should eq(300) }

    its([:time_efficiency]) { should eq(0) }

    its([:type_id]) { should eq(1010) }
  end

  describe "#item_id" do
    before { expect(options).to receive(:[]).with("item_id") }

    specify { expect { subject.item_id }.not_to raise_error }
  end

  describe "#type_id" do
    before { expect(options).to receive(:[]).with("type_id") }

    specify { expect { subject.type_id }.not_to raise_error }
  end

  describe "#location_id" do
    before { expect(options).to receive(:[]).with("location_id") }

    specify { expect { subject.location_id }.not_to raise_error }
  end

  describe "#quantity" do
    before { expect(options).to receive(:[]).with("quantity") }

    specify { expect { subject.quantity }.not_to raise_error }
  end

  describe "#time_efficiency" do
    before { expect(options).to receive(:[]).with("time_efficiency") }

    specify { expect { subject.time_efficiency }.not_to raise_error }
  end

  describe "#material_efficiency" do
    before { expect(options).to receive(:[]).with("material_efficiency") }

    specify { expect { subject.material_efficiency }.not_to raise_error }
  end

  describe "#runs" do
    before { expect(options).to receive(:[]).with("runs") }

    specify { expect { subject.runs }.not_to raise_error }
  end

  describe "#location_flag" do
    before { expect(options).to receive(:[]).with("location_flag") }

    specify { expect { subject.location_flag }.not_to raise_error }
  end
end

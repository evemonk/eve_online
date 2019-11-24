# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::Region do
  it { should be_a(EveOnline::ESI::Models::Base) }

  let(:options) { double }

  subject { described_class.new(options) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#as_json" do
    let(:region) { described_class.new(options) }

    before { expect(region).to receive(:constellations).and_return([20_000_001]) }

    before { expect(region).to receive(:description).and_return("The Derelik region...") }

    before { expect(region).to receive(:name).and_return("Derelik") }

    before { expect(region).to receive(:region_id).and_return(10_000_001) }

    subject { region.as_json }

    its([:constellations]) { should eq([20_000_001]) }

    its([:description]) { should eq("The Derelik region...") }

    its([:name]) { should eq("Derelik") }

    its([:region_id]) { should eq(10_000_001) }
  end

  describe "#constellations" do
    before { expect(options).to receive(:[]).with("constellations") }

    specify { expect { subject.constellations }.not_to raise_error }
  end

  describe "#description" do
    before { expect(options).to receive(:[]).with("description") }

    specify { expect { subject.description }.not_to raise_error }
  end

  describe "#name" do
    before { expect(options).to receive(:[]).with("name") }

    specify { expect { subject.name }.not_to raise_error }
  end

  describe "#region_id" do
    before { expect(options).to receive(:[]).with("region_id") }

    specify { expect { subject.region_id }.not_to raise_error }
  end
end

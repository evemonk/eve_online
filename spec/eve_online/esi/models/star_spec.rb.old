# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::Star do
  let(:options) { double }

  subject { described_class.new(options) }

  it { should be_a(EveOnline::ESI::Models::Base) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#as_json" do
    let(:star) { described_class.new(options) }

    before { expect(star).to receive(:age).and_return(14_262_808_228) }

    before { expect(star).to receive(:luminosity).and_return(0.01575000025331974) }

    before { expect(star).to receive(:name).and_return("Tanoo - Star") }

    before { expect(star).to receive(:radius).and_return(126_700_000) }

    before { expect(star).to receive(:solar_system_id).and_return(30_000_001) }

    before { expect(star).to receive(:spectral_class).and_return("K2 V") }

    before { expect(star).to receive(:temperature).and_return(4567) }

    before { expect(star).to receive(:type_id).and_return(45_041) }

    subject { star.as_json }

    its([:age]) { should eq(14_262_808_228) }

    its([:luminosity]) { should eq(0.01575000025331974) }

    its([:name]) { should eq("Tanoo - Star") }

    its([:radius]) { should eq(126_700_000) }

    its([:solar_system_id]) { should eq(30_000_001) }

    its([:spectral_class]) { should eq("K2 V") }

    its([:temperature]) { should eq(4567) }

    its([:type_id]) { should eq(45_041) }
  end

  describe "#age" do
    before { expect(options).to receive(:[]).with("age") }

    specify { expect { subject.age }.not_to raise_error }
  end

  describe "#luminosity" do
    before { expect(options).to receive(:[]).with("luminosity") }

    specify { expect { subject.luminosity }.not_to raise_error }
  end

  describe "#name" do
    before { expect(options).to receive(:[]).with("name") }

    specify { expect { subject.name }.not_to raise_error }
  end

  describe "#radius" do
    before { expect(options).to receive(:[]).with("radius") }

    specify { expect { subject.radius }.not_to raise_error }
  end

  describe "#solar_system_id" do
    before { expect(options).to receive(:[]).with("solar_system_id") }

    specify { expect { subject.solar_system_id }.not_to raise_error }
  end

  describe "#spectral_class" do
    before { expect(options).to receive(:[]).with("spectral_class") }

    specify { expect { subject.spectral_class }.not_to raise_error }
  end

  describe "#temperature" do
    before { expect(options).to receive(:[]).with("temperature") }

    specify { expect { subject.temperature }.not_to raise_error }
  end

  describe "#type_id" do
    before { expect(options).to receive(:[]).with("type_id") }

    specify { expect { subject.type_id }.not_to raise_error }
  end
end

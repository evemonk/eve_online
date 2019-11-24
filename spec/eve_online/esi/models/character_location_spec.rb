# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::CharacterLocation do
  it { should be_a(EveOnline::ESI::Models::Base) }

  let(:options) { double }

  subject { described_class.new(options) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#as_json" do
    let(:model) { described_class.new(options) }

    let(:structure_id) { double }

    before { expect(model).to receive(:solar_system_id).and_return(30_004_971) }

    before { expect(model).to receive(:station_id).and_return(60_014_689) }

    before { expect(model).to receive(:structure_id).and_return(structure_id) }

    subject { model.as_json }

    its([:solar_system_id]) { should eq(30_004_971) }

    its([:station_id]) { should eq(60_014_689) }

    its([:structure_id]) { should eq(structure_id) }
  end

  describe "#solar_system_id" do
    before { expect(options).to receive(:[]).with("solar_system_id") }

    specify { expect { subject.solar_system_id }.not_to raise_error }
  end

  describe "#station_id" do
    before { expect(options).to receive(:[]).with("station_id") }

    specify { expect { subject.station_id }.not_to raise_error }
  end

  describe "#structure_id" do
    before { expect(options).to receive(:[]).with("structure_id") }

    specify { expect { subject.structure_id }.not_to raise_error }
  end
end

# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::Planet do
  let(:options) { double }

  subject { described_class.new(options) }

  it { should be_a(EveOnline::ESI::Models::Base) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#as_json" do
    let(:planet) { described_class.new(options) }

    before { expect(planet).to receive(:name).and_return("Tanoo I") }

    before { expect(planet).to receive(:planet_id).and_return(40_000_002) }

    before { expect(planet).to receive(:system_id).and_return(30_000_001) }

    before { expect(planet).to receive(:type_id).and_return(11) }

    subject { planet.as_json }

    its([:name]) { should eq("Tanoo I") }

    its([:planet_id]) { should eq(40_000_002) }

    its([:system_id]) { should eq(30_000_001) }

    its([:type_id]) { should eq(11) }
  end

  describe "#name" do
    before { expect(options).to receive(:[]).with("name") }

    specify { expect { subject.name }.not_to raise_error }
  end

  describe "#planet_id" do
    before { expect(options).to receive(:[]).with("planet_id") }

    specify { expect { subject.planet_id }.not_to raise_error }
  end

  describe "#system_id" do
    before { expect(options).to receive(:[]).with("system_id") }

    specify { expect { subject.system_id }.not_to raise_error }
  end

  describe "#type_id" do
    before { expect(options).to receive(:[]).with("type_id") }

    specify { expect { subject.type_id }.not_to raise_error }
  end

  describe "#position" do
    context "when @position set" do
      let(:position) { double }

      before { subject.instance_variable_set(:@position, position) }

      specify { expect(subject.position).to eq(position) }
    end

    context "when @position not set" do
      let(:position) { double }

      let(:options) { {"position" => position} }

      let(:model) { instance_double(EveOnline::ESI::Models::Position) }

      before { expect(EveOnline::ESI::Models::Position).to receive(:new).with(position).and_return(model) }

      specify { expect { subject.position }.not_to raise_error }

      specify { expect { subject.position }.to change { subject.instance_variable_get(:@position) }.from(nil).to(model) }
    end
  end
end

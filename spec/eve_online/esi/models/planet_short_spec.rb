# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::PlanetShort do
  let(:options) { double }

  subject { described_class.new(options) }

  it { should be_a(EveOnline::ESI::Models::Base) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#as_json" do
    let(:planet_short) { described_class.new(options) }

    before { expect(planet_short).to receive(:planet_id).and_return(40_000_002) }

    subject { planet_short.as_json }

    its([:planet_id]) { should eq(40_000_002) }
  end

  describe "#planet_id" do
    before { expect(options).to receive(:[]).with("planet_id") }

    specify { expect { subject.planet_id }.not_to raise_error }
  end

  describe "#asteroid_belt_ids" do
    before { expect(options).to receive(:fetch).with("asteroid_belts", []) }

    specify { expect { subject.asteroid_belt_ids }.not_to raise_error }
  end

  describe "#moon_ids" do
    before { expect(options).to receive(:fetch).with("moons", []) }

    specify { expect { subject.moon_ids }.not_to raise_error }
  end
end

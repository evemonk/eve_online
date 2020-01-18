# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::Planets do
  it { should be_a(EveOnline::ESI::Models::Base) }

  let(:options) { double }

  subject { described_class.new(options) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#planets" do
    # TODO: one more spec for case when options is not array
    let(:planet_short) { instance_double(EveOnline::ESI::Models::PlanetShort) }

    let(:option) { double }

    let(:options) { [option] }

    before { expect(EveOnline::ESI::Models::PlanetShort).to receive(:new).with(option).and_return(planet_short) }

    before { expect(subject.planets).to eq([planet_short]) }
  end
end

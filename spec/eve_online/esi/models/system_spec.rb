# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::System do
  it { should be_a(EveOnline::ESI::Models::Base) }

  let(:options) { double }

  subject { described_class.new(options) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#as_json" do
    let(:system) { described_class.new(options) }

    before { expect(system).to receive(:constellation_id).and_return(20_000_001) }

    before { expect(system).to receive(:name).and_return("Tanoo") }

    before { expect(system).to receive(:security_class).and_return("B") }

    before { expect(system).to receive(:security_status).and_return(0.8583240509033203) }

    before { expect(system).to receive(:star_id).and_return(40_000_001) }

    before { expect(system).to receive(:system_id).and_return(30_000_001) }

    subject { system.as_json }

    its([:constellation_id]) { should eq(20_000_001) }

    its([:name]) { should eq("Tanoo") }

    its([:security_class]) { should eq("B") }

    its([:security_status]) { should eq(0.8583240509033203) }

    its([:star_id]) { should eq(40_000_001) }

    its([:system_id]) { should eq(30_000_001) }
  end

  describe "#constellation_id" do
    before { expect(options).to receive(:[]).with("constellation_id") }

    specify { expect { subject.constellation_id }.not_to raise_error }
  end

  describe "#name" do
    before { expect(options).to receive(:[]).with("name") }

    specify { expect { subject.name }.not_to raise_error }
  end

  describe "#security_class" do
    before { expect(options).to receive(:[]).with("security_class") }

    specify { expect { subject.security_class }.not_to raise_error }
  end

  describe "#security_status" do
    before { expect(options).to receive(:[]).with("security_status") }

    specify { expect { subject.security_status }.not_to raise_error }
  end

  describe "#star_id" do
    before { expect(options).to receive(:[]).with("star_id") }

    specify { expect { subject.star_id }.not_to raise_error }
  end

  describe "#system_id" do
    before { expect(options).to receive(:[]).with("system_id") }

    specify { expect { subject.system_id }.not_to raise_error }
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

  describe "#planets" do
    context "when @planets set" do
      let(:planets) { double }

      before { subject.instance_variable_set(:@planets, planets) }

      specify { expect(subject.planets).to eq(planets) }
    end

    context "when @planets not set" do
      let(:option) { double }

      let(:options) { {"planets" => option} }

      let(:planets) { instance_double(EveOnline::ESI::Models::Planets) }

      let(:output) { double }

      before { expect(EveOnline::ESI::Models::Planets).to receive(:new).with(option).and_return(planets) }

      before { expect(planets).to receive(:planets).and_return(output) }

      specify { expect { subject.planets }.not_to raise_error }

      specify { expect { subject.planets }.to change { subject.instance_variable_get(:@planets) }.from(nil).to(output) }
    end
  end

  describe "#stargate_ids" do
    before { expect(options).to receive(:fetch).with("stargates", []) }

    specify { expect { subject.stargate_ids }.not_to raise_error }
  end

  describe "#station_ids" do
    before { expect(options).to receive(:fetch).with("stations", []) }

    specify { expect { subject.station_ids }.not_to raise_error }
  end
end

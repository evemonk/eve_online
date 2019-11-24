# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::Station do
  let(:options) { double }

  subject { described_class.new(options) }

  it { should be_a(EveOnline::ESI::Models::Base) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#as_json" do
    let(:station) { described_class.new(options) }

    before { expect(station).to receive(:max_dockable_ship_volume).and_return(50_000_000) }

    before { expect(station).to receive(:name).and_return("Tanoo V - Moon 1 - Ammatar Consulate Bureau") }

    before { expect(station).to receive(:office_rental_cost).and_return(422_500) }

    before { expect(station).to receive(:owner).and_return(1_000_126) }

    before { expect(station).to receive(:race_id).and_return(2) }

    before { expect(station).to receive(:reprocessing_efficiency).and_return(0.5) }

    before { expect(station).to receive(:reprocessing_stations_take).and_return(0.05) }

    before { expect(station).to receive(:services).and_return(["bounty-missions", "courier-missions", "interbus", "reprocessing-plant", "market", "stock-exchange", "cloning", "repair-facilities", "fitting", "news", "insurance", "docking", "office-rental", "loyalty-point-store", "navy-offices", "security-offices"]) }

    before { expect(station).to receive(:station_id).and_return(60_012_526) }

    before { expect(station).to receive(:system_id).and_return(30_000_001) }

    before { expect(station).to receive(:type_id).and_return(2502) }

    subject { station.as_json }

    its([:max_dockable_ship_volume]) { should eq(50_000_000) }

    its([:name]) { should eq("Tanoo V - Moon 1 - Ammatar Consulate Bureau") }

    its([:office_rental_cost]) { should eq(422_500) }

    its([:owner]) { should eq(1_000_126) }

    its([:race_id]) { should eq(2) }

    its([:reprocessing_efficiency]) { should eq(0.5) }

    its([:reprocessing_stations_take]) { should eq(0.05) }

    its([:services]) { should eq(["bounty-missions", "courier-missions", "interbus", "reprocessing-plant", "market", "stock-exchange", "cloning", "repair-facilities", "fitting", "news", "insurance", "docking", "office-rental", "loyalty-point-store", "navy-offices", "security-offices"]) }

    its([:station_id]) { should eq(60_012_526) }

    its([:system_id]) { should eq(30_000_001) }

    its([:type_id]) { should eq(2502) }
  end

  describe "#max_dockable_ship_volume" do
    before { expect(options).to receive(:[]).with("max_dockable_ship_volume") }

    specify { expect { subject.max_dockable_ship_volume }.not_to raise_error }
  end

  describe "#name" do
    before { expect(options).to receive(:[]).with("name") }

    specify { expect { subject.name }.not_to raise_error }
  end

  describe "#office_rental_cost" do
    before { expect(options).to receive(:[]).with("office_rental_cost") }

    specify { expect { subject.office_rental_cost }.not_to raise_error }
  end

  describe "#owner" do
    before { expect(options).to receive(:[]).with("owner") }

    specify { expect { subject.owner }.not_to raise_error }
  end

  describe "#race_id" do
    before { expect(options).to receive(:[]).with("race_id") }

    specify { expect { subject.race_id }.not_to raise_error }
  end

  describe "#reprocessing_efficiency" do
    before { expect(options).to receive(:[]).with("reprocessing_efficiency") }

    specify { expect { subject.reprocessing_efficiency }.not_to raise_error }
  end

  describe "#reprocessing_stations_take" do
    before { expect(options).to receive(:[]).with("reprocessing_stations_take") }

    specify { expect { subject.reprocessing_stations_take }.not_to raise_error }
  end

  describe "#services" do
    before { expect(options).to receive(:[]).with("services") }

    specify { expect { subject.services }.not_to raise_error }
  end

  describe "#station_id" do
    before { expect(options).to receive(:[]).with("station_id") }

    specify { expect { subject.station_id }.not_to raise_error }
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

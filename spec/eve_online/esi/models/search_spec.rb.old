# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::Search do
  it { should be_a(EveOnline::ESI::Models::Base) }

  let(:options) { double }

  subject { described_class.new(options) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#as_json" do
    let(:search) { described_class.new(options) }

    let(:agent_ids) { double }

    let(:alliance_ids) { double }

    let(:character_ids) { double }

    let(:constellation_ids) { double }

    let(:corporation_ids) { double }

    let(:faction_ids) { double }

    let(:inventory_type_ids) { double }

    let(:region_ids) { double }

    let(:solar_system_ids) { double }

    let(:station_ids) { double }

    before { expect(search).to receive(:agent_ids).and_return(agent_ids) }

    before { expect(search).to receive(:alliance_ids).and_return(alliance_ids) }

    before { expect(search).to receive(:character_ids).and_return(character_ids) }

    before { expect(search).to receive(:constellation_ids).and_return(constellation_ids) }

    before { expect(search).to receive(:corporation_ids).and_return(corporation_ids) }

    before { expect(search).to receive(:faction_ids).and_return(faction_ids) }

    before { expect(search).to receive(:inventory_type_ids).and_return(inventory_type_ids) }

    before { expect(search).to receive(:region_ids).and_return(region_ids) }

    before { expect(search).to receive(:solar_system_ids).and_return(solar_system_ids) }

    before { expect(search).to receive(:station_ids).and_return(station_ids) }

    subject { search.as_json }

    its([:agent_ids]) { should eq(agent_ids) }

    its([:alliance_ids]) { should eq(alliance_ids) }

    its([:character_ids]) { should eq(character_ids) }

    its([:constellation_ids]) { should eq(constellation_ids) }

    its([:corporation_ids]) { should eq(corporation_ids) }

    its([:faction_ids]) { should eq(faction_ids) }

    its([:inventory_type_ids]) { should eq(inventory_type_ids) }

    its([:region_ids]) { should eq(region_ids) }

    its([:solar_system_ids]) { should eq(solar_system_ids) }

    its([:station_ids]) { should eq(station_ids) }
  end

  describe "#agent_ids" do
    before { expect(options).to receive(:fetch).with("agent", []) }

    specify { expect { subject.agent_ids }.not_to raise_error }
  end

  describe "#alliance_ids" do
    before { expect(options).to receive(:fetch).with("alliance", []) }

    specify { expect { subject.alliance_ids }.not_to raise_error }
  end

  describe "#character_ids" do
    before { expect(options).to receive(:fetch).with("character", []) }

    specify { expect { subject.character_ids }.not_to raise_error }
  end

  describe "#constellation_ids" do
    before { expect(options).to receive(:fetch).with("constellation", []) }

    specify { expect { subject.constellation_ids }.not_to raise_error }
  end

  describe "#corporation_ids" do
    before { expect(options).to receive(:fetch).with("corporation", []) }

    specify { expect { subject.corporation_ids }.not_to raise_error }
  end

  describe "#faction_ids" do
    before { expect(options).to receive(:fetch).with("faction", []) }

    specify { expect { subject.faction_ids }.not_to raise_error }
  end

  describe "#inventory_type_ids" do
    before { expect(options).to receive(:fetch).with("inventory_type", []) }

    specify { expect { subject.inventory_type_ids }.not_to raise_error }
  end

  describe "#region_ids" do
    before { expect(options).to receive(:fetch).with("region", []) }

    specify { expect { subject.region_ids }.not_to raise_error }
  end

  describe "#solar_system_ids" do
    before { expect(options).to receive(:fetch).with("solar_system", []) }

    specify { expect { subject.solar_system_ids }.not_to raise_error }
  end

  describe "#station_ids" do
    before { expect(options).to receive(:fetch).with("stations", []) }

    specify { expect { subject.station_ids }.not_to raise_error }
  end
end

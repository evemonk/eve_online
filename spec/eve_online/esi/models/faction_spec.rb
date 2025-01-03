# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::Faction do
  it { should be_a(EveOnline::ESI::Models::Base) }

  let(:options) { double }

  subject { described_class.new(options) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#as_json" do
    let(:faction) { described_class.new(options) }

    before { expect(faction).to receive(:corporation_id).and_return(1_000_051) }

    before { expect(faction).to receive(:description).and_return("The Minmatar Republic was formed over a century ago when the Minmatar threw...") }

    before { expect(faction).to receive(:id).and_return(500_002) }

    before { expect(faction).to receive(:is_unique).and_return(true) }

    before { expect(faction).to receive(:militia_corporation_id).and_return(1_000_182) }

    before { expect(faction).to receive(:name).and_return("Minmatar Republic") }

    before { expect(faction).to receive(:size_factor).and_return(5.0) }

    before { expect(faction).to receive(:solar_system_id).and_return(30_002_544) }

    before { expect(faction).to receive(:station_count).and_return(570) }

    before { expect(faction).to receive(:station_system_count).and_return(291) }

    subject { faction.as_json }

    its([:corporation_id]) { should eq(1_000_051) }

    its([:description]) { should eq("The Minmatar Republic was formed over a century ago when the Minmatar threw...") }

    its([:id]) { should eq(500_002) }

    its([:is_unique]) { should eq(true) }

    its([:militia_corporation_id]) { should eq(1_000_182) }

    its([:name]) { should eq("Minmatar Republic") }

    its([:size_factor]) { should eq(5.0) }

    its([:solar_system_id]) { should eq(30_002_544) }

    its([:station_count]) { should eq(570) }

    its([:station_system_count]) { should eq(291) }
  end

  describe "#corporation_id" do
    before { expect(options).to receive(:[]).with("corporation_id") }

    specify { expect { subject.corporation_id }.not_to raise_error }
  end

  describe "#description" do
    before { expect(options).to receive(:[]).with("description") }

    specify { expect { subject.description }.not_to raise_error }
  end

  describe "#id" do
    before { expect(options).to receive(:[]).with("faction_id") }

    specify { expect { subject.id }.not_to raise_error }
  end

  describe "#is_unique" do
    before { expect(options).to receive(:[]).with("is_unique") }

    specify { expect { subject.is_unique }.not_to raise_error }
  end

  describe "#militia_corporation_id" do
    before { expect(options).to receive(:[]).with("militia_corporation_id") }

    specify { expect { subject.militia_corporation_id }.not_to raise_error }
  end

  describe "#name" do
    before { expect(options).to receive(:[]).with("name") }

    specify { expect { subject.name }.not_to raise_error }
  end

  describe "#size_factor" do
    before { expect(options).to receive(:[]).with("size_factor") }

    specify { expect { subject.size_factor }.not_to raise_error }
  end

  describe "#solar_system_id" do
    before { expect(options).to receive(:[]).with("solar_system_id") }

    specify { expect { subject.solar_system_id }.not_to raise_error }
  end

  describe "#station_count" do
    before { expect(options).to receive(:[]).with("station_count") }

    specify { expect { subject.station_count }.not_to raise_error }
  end

  describe "#station_system_count" do
    before { expect(options).to receive(:[]).with("station_system_count") }

    specify { expect { subject.station_system_count }.not_to raise_error }
  end
end

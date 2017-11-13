require 'spec_helper'

describe EveOnline::ESI::Factions do
  let(:options) { {} }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://esi.tech.ccp.is/v2/universe/factions/?datasource=tranquility&language=en-us') }

  describe '#initialize' do
    its(:parser) { should eq(JSON) }
  end

  describe '#factions' do
    let(:faction) { double }

    let(:response) do
      [
        {
           'faction_id' => 500_002,
           'name' => 'Minmatar Republic',
           'description' => 'The Minmatar Republic was formed over a century ago when the Minmatar threw',
           'size_factor' => 5.0,
           'station_count' => 570,
           'station_system_count' => 291,
           'is_unique' => true,
           'solar_system_id' => 30_002_544,
           'corporation_id' => 1_000_051,
           'militia_corporation_id' => 1_000_182
        }
      ]
    end

    before do
      #
      # subject.response # => [{"faction_id"=>500002, "name"=>"Minmatar Republic", "description"=>"The Minmatar Republic was formed over a century ago when the Minmatar threw", "size_factor"=>5.0, "station_count"=>570, "station_system_count"=>291, "is_unique"=>true, "solar_system_id"=>30002544, "corporation_id"=>1000051, "militia_corporation_id"=>1000182}]
      #
      expect(subject).to receive(:response).and_return(response)
    end

    before do
      #
      # EveOnline::ESI::Models::Faction.new(response.first) # => faction
      #
      expect(EveOnline::ESI::Models::Faction).to receive(:new).with(response.first).and_return(faction)
    end

    specify { expect(subject.factions).to eq([faction]) }

    specify { expect { subject.factions }.to change { subject.instance_variable_defined?(:@_memoized_factions) }.from(false).to(true) }
  end

  describe '#scope' do
    specify { expect(subject.scope).to eq(nil) }
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq('https://esi.tech.ccp.is/v2/universe/factions/?datasource=tranquility&language=en-us')
    end
  end
end

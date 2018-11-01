# frozen_string_literal: true

require 'spec_helper'

describe EveOnline::ESI::Factions do
  let(:options) { {} }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://esi.evetech.net/v2/universe/factions/?datasource=%<datasource>s') }

  describe '#initialize' do
    its(:token) { should eq(nil) }

    its(:parser) { should eq(JSON) }

    its(:_read_timeout) { should eq(60) }

    its(:_open_timeout) { should eq(60) }

    its(:datasource) { should eq('tranquility') }
  end

  describe '#factions' do
    context 'when @factions set' do
      let(:factions) { [instance_double(EveOnline::ESI::Models::Faction)] }

      before { subject.instance_variable_set(:@factions, factions) }

      specify { expect(subject.factions).to eq(factions) }
    end

    context 'when @ancestries not set' do
      let(:faction) { instance_double(EveOnline::ESI::Models::Faction) }

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

      specify { expect { subject.factions }.to change { subject.instance_variable_get(:@factions) }.from(nil).to([faction]) }
    end
  end

  describe '#scope' do
    specify { expect(subject.scope).to eq(nil) }
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq('https://esi.evetech.net/v2/universe/factions/?datasource=tranquility')
    end
  end
end

# frozen_string_literal: true

require 'spec_helper'

describe EveOnline::ESI::Races do
  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://esi.tech.ccp.is/v1/universe/races/?datasource=%<datasource>s&language=en-us') }

  describe '#initialize' do
    its(:token) { should eq(nil) }

    its(:parser) { should eq(JSON) }

    its(:datasource) { should eq('tranquility') }
  end

  describe '#races' do
    let(:race) { double }

    let(:response) do
      [
        {
          'race_id' => 2,
          'name' => 'Minmatar',
          'description' => 'Once a thriving tribal civilization, the Minmatar...',
          'alliance_id' => 500_002
        }
      ]
    end

    before do
      #
      # subject.response # => [{"race_id"=>2, "name"=>"Minmatar", "description"=> "Once a thriving tribal civilization, the Minmatar...", "alliance_id"=>500002}]
      #
      expect(subject).to receive(:response).and_return(response)
    end

    before do
      #
      # EveOnline::ESI::Models::Race.new(response.first) # => race
      #
      expect(EveOnline::ESI::Models::Race).to receive(:new).with(response.first).and_return(race)
    end

    specify { expect(subject.races).to eq([race]) }

    specify { expect { subject.races }.to change { subject.instance_variable_defined?(:@_memoized_races) }.from(false).to(true) }
  end

  describe '#scope' do
    specify { expect(subject.scope).to eq(nil) }
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq('https://esi.tech.ccp.is/v1/universe/races/?datasource=tranquility&language=en-us')
    end
  end
end

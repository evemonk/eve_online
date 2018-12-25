# frozen_string_literal: true

require 'spec_helper'

describe EveOnline::ESI::UniverseRaces do
  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://esi.evetech.net/v1/universe/races/?datasource=%<datasource>s') }

  describe '#initialize' do
    its(:token) { should eq(nil) }

    its(:parser) { should eq(JSON) }

    its(:_read_timeout) { should eq(60) }

    its(:_open_timeout) { should eq(60) }

    its(:datasource) { should eq('tranquility') }
  end

  describe '#races' do
    context 'when @races set' do
      let(:races) { [instance_double(EveOnline::ESI::Models::Race)] }

      before { subject.instance_variable_set(:@races, races) }

      specify { expect(subject.races).to eq(races) }
    end

    context 'when @races not set' do
      let(:race) { instance_double(EveOnline::ESI::Models::Race) }

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

      specify { expect { subject.races }.to change { subject.instance_variable_get(:@races) }.from(nil).to([race]) }
    end
  end

  describe '#etag' do
    let(:current_etag) { double }

    before { expect(subject).to receive(:current_etag).and_return(current_etag) }

    specify { expect(subject.etag).to eq(current_etag) }
  end

  describe '#scope' do
    specify { expect(subject.scope).to eq(nil) }
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq('https://esi.evetech.net/v1/universe/races/?datasource=tranquility')
    end
  end
end

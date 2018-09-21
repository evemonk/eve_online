# frozen_string_literal: true

require 'spec_helper'

describe EveOnline::ESI::CharacterBlueprints do
  let(:options) { { token: 'token123', character_id: 12_345_678 } }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://esi.evetech.net/v2/characters/%<character_id>s/blueprints/?datasource=%<datasource>s&page=%<page>s') }

  describe '#initialize' do
    context 'without options' do
      its(:token) { should eq('token123') }

      its(:parser) { should eq(JSON) }

      its(:_read_timeout) { should eq(60) }

      its(:_open_timeout) { should eq(60) }

      its(:datasource) { should eq('tranquility') }

      its(:character_id) { should eq(12_345_678) }

      its(:page) { should eq(1) }
    end

    context 'with options' do
      let(:options) { { token: 'token123', character_id: 12_345_678, page: 10 } }

      its(:page) { should eq(10) }
    end
  end

  describe '#blueprints' do
    let(:blueprint) { double }

    let(:response) do
      [
        {
          'item_id' => 716_338_097,
          'type_id' => 1010,
          'location_id' => 61_000_032,
          'location_flag' => 'Hangar',
          'quantity' => -2,
          'time_efficiency' => 0,
          'material_efficiency' => 10,
          'runs' => 300
        }
      ]
    end

    before do
      #
      # subject.response # => [{"item_id"=>716338097, "type_id"=>1010, "location_id"=>61000032, "location_flag"=>"Hangar", "quantity"=>-2, "time_efficiency"=>0, "material_efficiency"=>10, "runs"=>300}]
      #
      expect(subject).to receive(:response).and_return(response)
    end

    before do
      #
      # EveOnline::ESI::Models::Blueprint.new(response.first) # => blueprint
      #
      expect(EveOnline::ESI::Models::Blueprint).to receive(:new).with(response.first).and_return(blueprint)
    end

    specify { expect(subject.blueprints).to eq([blueprint]) }

    specify { expect { subject.blueprints }.to change { subject.instance_variable_defined?(:@_memoized_blueprints) }.from(false).to(true) }
  end

  describe '#scope' do
    specify { expect(subject.scope).to eq('esi-characters.read_blueprints.v1') }
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq('https://esi.evetech.net/v2/characters/12345678/blueprints/?datasource=tranquility&page=1')
    end
  end
end

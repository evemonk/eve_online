# frozen_string_literal: true

require 'spec_helper'

describe EveOnline::ESI::CorporationBlueprints do
  let(:options) { { token: 'token123', corporation_id: 12_345_678 } }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://esi.evetech.net/v2/corporations/%<corporation_id>s/blueprints/?datasource=%<datasource>s&page=%<page>s') }

  describe '#initialize' do
    context 'without options' do
      its(:token) { should eq('token123') }

      its(:parser) { should eq(JSON) }

      its(:_read_timeout) { should eq(60) }

      its(:_open_timeout) { should eq(60) }

      its(:datasource) { should eq('tranquility') }

      its(:corporation_id) { should eq(12_345_678) }

      its(:page) { should eq(1) }
    end

    context 'with options' do
      let(:options) { { token: 'token123', corporation_id: 12_345_678, page: 10 } }

      its(:page) { should eq(10) }
    end
  end

  describe '#blueprints' do
    let(:blueprint) { instance_double(EveOnline::ESI::Models::Blueprint) }

    let(:response) do
      [
        {
          'item_id' => 1_000_000_010_495,
          'type_id' => 691,
          'location_id' => 60_014_719,
          'location_flag' => 'CorpSAG1',
          'quantity' => 1,
          'time_efficiency' => 0,
          'material_efficiency' => 0,
          'runs' => -1
        }
      ]
    end

    before do
      #
      # subject.response # => [{"item_id"=>1000000010495, "type_id"=>691, "location_id"=>60014719, "location_flag"=>"CorpSAG1", "quantity"=>1, "time_efficiency"=>0, "material_efficiency"=>0, "runs"=>-1}]
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
    specify { expect(subject.scope).to eq('esi-corporations.read_blueprints.v1') }
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq('https://esi.evetech.net/v2/corporations/12345678/blueprints/?datasource=tranquility&page=1')
    end
  end
end

require 'spec_helper'

describe EveOnline::ESI::CorporationBlueprints do
  let(:options) { { token: 'token123', corporation_id: 12_345_678 } }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://esi.tech.ccp.is/v1/corporations/%<corporation_id>s/blueprints/?datasource=tranquility&page=1') }

  describe '#initialize' do
    its(:parser) { should eq(JSON) }

    its(:corporation_id) { should eq(12_345_678) }
  end

  describe '#blueprints' do
    let(:blueprint) { double }

    let(:response) do
      [
        {
          'item_id' => 1000000010495,
          'type_id' => 691,
          'location_id' => 60014719,
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
      expect(subject.url).to eq('https://esi.tech.ccp.is/v1/corporations/12345678/blueprints/?datasource=tranquility&page=1')
    end
  end
end

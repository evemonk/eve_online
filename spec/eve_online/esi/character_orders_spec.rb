require 'spec_helper'

describe EveOnline::ESI::CharacterOrders do
  let(:options) { { token: 'token123', character_id: 12_345_678 } }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://esi.tech.ccp.is/v1/characters/%<character_id>s/orders/?datasource=tranquility') }

  describe '#initialize' do
    its(:token) { should eq('token123') }

    its(:parser) { should eq(JSON) }

    its(:character_id) { should eq(12_345_678) }
  end

  describe '#orders' do
    let(:order) { double }

    let(:response) do
      [
        {
          'order_id' => 123,
          'type_id' => 456,
          'region_id' => 123,
          'location_id' => 456,
          'range' => 'station',
          'is_buy_order' => true,
          'price' => 33.3,
          'volume_total' => 123456,
          'volume_remain' => 4422,
          'issued' => '2016-09-03T05:12:25Z',
          'state' => 'open',
          'min_volume' => 1,
          'account_id' => 1000,
          'duration' => 30,
          'is_corp' => false,
          'escrow' => 45.6
        }
      ]
    end

    before do
      #
      # subject.response # => [{"order_id"=>123, "type_id"=>456, "region_id"=>123, "location_id"=> 456, "range"=>"station", "is_buy_order"=>true, "price"=>33.3, "volume_total"=>123456, "volume_remain"=>4422, "issued"=>"2016-09-03T05:12:25Z", "state"=>"open", "min_volume"=>1, "account_id"=>1000, "duration"=>30, "is_corp"=>false, "escrow"=>45.6}]
      #
      expect(subject).to receive(:response).and_return(response)
    end

    before do
      #
      # EveOnline::ESI::Models::CharacterOrder.new(response.first) # => order
      #
      expect(EveOnline::ESI::Models::CharacterOrder).to receive(:new).with(response.first).and_return(order)
    end

    specify { expect(subject.orders).to eq([order]) }

    specify { expect { subject.orders }.to change { subject.instance_variable_defined?(:@_memoized_orders) }.from(false).to(true) }
  end

  describe '#scope' do
    specify { expect(subject.scope).to eq('esi-markets.read_character_orders.v1') }
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq('https://esi.tech.ccp.is/v1/characters/12345678/orders/?datasource=tranquility')
    end
  end
end

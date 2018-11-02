# frozen_string_literal: true

require 'spec_helper'

describe EveOnline::ESI::MarketHistory do
  let(:options) { { region_id: 10_000_002, type_id: 28_606 } }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://esi.evetech.net/v1/markets/%<region_id>s/history/?datasource=%<datasource>s&type_id=%<type_id>s') }

  describe '#initialize' do
    its(:token) { should eq(nil) }

    its(:parser) { should eq(JSON) }

    its(:_read_timeout) { should eq(60) }

    its(:_open_timeout) { should eq(60) }

    its(:datasource) { should eq('tranquility') }

    its(:region_id) { should eq(10_000_002) }

    its(:type_id) { should eq(28_606) }
  end

  describe '#history' do
    context 'when @history set' do
      let(:history) { [instance_double(EveOnline::ESI::Models::MarketHistory)] }

      before { subject.instance_variable_set(:@history, history) }

      specify { expect(subject.history).to eq(history) }
    end

    context 'when @history not set' do
      let(:market_history) { instance_double(EveOnline::ESI::Models::MarketHistory) }

      let(:response) do
        [
          {
            'date' => '2015-05-01',
            'order_count' => 2267,
            'volume' => 16_276_782_035,
            'highest' => 5.27,
            'average' => 5.25,
            'lowest' => 5.11
          }
        ]
      end

      before do
        #
        # subject.response # => [{"date"=>"2015-05-01", "order_count"=>2267, "volume"=>16276782035, "highest"=>5.27, "average"=>5.25, "lowest"=>5.11}]
        #
        expect(subject).to receive(:response).and_return(response)
      end

      before do
        #
        # EveOnline::ESI::Models::MarketHistory.new(response.first) # => market_history
        #
        expect(EveOnline::ESI::Models::MarketHistory).to receive(:new).with(response.first).and_return(market_history)
      end

      specify { expect(subject.history).to eq([market_history]) }

      specify { expect { subject.history }.to change { subject.instance_variable_get(:@history) }.from(nil).to([market_history]) }
    end
  end

  describe '#scope' do
    specify { expect(subject.scope).to eq(nil) }
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq('https://esi.evetech.net/v1/markets/10000002/history/?datasource=tranquility&type_id=28606')
    end
  end
end

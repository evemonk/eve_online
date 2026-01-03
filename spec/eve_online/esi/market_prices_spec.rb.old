# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::MarketPrices do
  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_PATH).to eq("/v1/markets/prices/") }

  describe "#initialize" do
    its(:token) { should eq(nil) }

    its(:_read_timeout) { should eq(60) }

    its(:_open_timeout) { should eq(60) }

    its(:_write_timeout) { should eq(60) }
  end

  describe "#market_prices" do
    context "when @market_prices set" do
      let(:market_prices) { [instance_double(EveOnline::ESI::Models::MarketPrice)] }

      before { subject.instance_variable_set(:@market_prices, market_prices) }

      specify { expect(subject.market_prices).to eq(market_prices) }
    end

    context "when @market_prices not set" do
      let(:market_price) { instance_double(EveOnline::ESI::Models::MarketPrice) }

      let(:response) do
        [
          {
            adjusted_price: 923296.88,
            average_price: 1273871.6,
            type_id: 32_772
          }
        ]
      end

      before do
        #
        # subject.response # => [{"adjusted_price"=>923296.88, "average_price"=>1273871.6, "type_id"=>32772}]
        #
        expect(subject).to receive(:response).and_return(response)
      end

      before do
        #
        # EveOnline::ESI::Models::MarketPrice.new(response.first) # => market_price
        #
        expect(EveOnline::ESI::Models::MarketPrice).to receive(:new).with(response.first).and_return(market_price)
      end

      specify { expect(subject.market_prices).to eq([market_price]) }

      specify { expect { subject.market_prices }.to change { subject.instance_variable_get(:@market_prices) }.from(nil).to([market_price]) }
    end
  end

  describe "#scope" do
    specify { expect(subject.scope).to eq(nil) }
  end

  describe "#path" do
    specify do
      expect(subject.path).to eq("/v1/markets/prices/")
    end
  end

  describe "#query" do
    specify do
      expect(subject.query).to eq({})
    end
  end

  describe "#url" do
    specify do
      expect(subject.url).to eq("https://esi.evetech.net/v1/markets/prices/")
    end
  end
end

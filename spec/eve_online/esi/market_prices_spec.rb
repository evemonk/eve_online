# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::MarketPrices do
  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_PATH).to eq("/v1/markets/prices/") }

  describe "#initialize" do
    its(:token) { should eq(nil) }

    its(:parser) { should eq(JSON) }

    its(:_read_timeout) { should eq(60) }

    its(:_open_timeout) { should eq(60) }

    if Gem::Version.new(RUBY_VERSION) >= Gem::Version.new("2.6.0")
      its(:_write_timeout) { should eq(60) }
    end
  end

  describe "#market_prices" do
    context "when @market_prices set" do
      let(:market_prices) { [instance_double(EveOnline::ESI::Models::MarketPrice)] }

      before { subject.instance_variable_set(:@market_prices, market_prices) }

      specify { expect(subject.market_prices).to eq(market_prices) }
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

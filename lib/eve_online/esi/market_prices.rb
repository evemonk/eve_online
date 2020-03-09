# frozen_string_literal: true

module EveOnline
  module ESI
    class MarketPrices < Base
      API_PATH = "/v1/markets/prices/"

      def market_prices
        @market_prices ||=
          begin
            output = []
            response.each do |market_price|
              output << Models::MarketPrice.new(market_price)
            end
            output
          end
      end

      def scope
      end

      def path
        API_PATH
      end
    end
  end
end

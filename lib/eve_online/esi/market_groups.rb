# frozen_string_literal: true

module EveOnline
  module ESI
    class MarketGroups < Base
      API_PATH = "/v1/markets/groups/"

      def market_group_ids
        response
      end

      def scope
      end

      def path
        API_PATH
      end
    end
  end
end

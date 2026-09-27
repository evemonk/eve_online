# frozen_string_literal: true

module EveOnline
  module ESI
    module Resources
      class MarketResources < Resource
        def groups
          response = get_request("markets/groups")

          Models::MarketGroups.new(body: response.body, headers: response.headers)
        end

        # @param id [Integer] An Eve item group ID
        def group(id:)
          response = get_request("markets/groups/#{id}")

          Models::MarketGroup.new(attributes: response.body, headers: response.headers)
        end

        def prices
          response = get_request("markets/prices")

          Collection.from_response(response, type: Models::MarketPrice)
        end

        # @param region_id [Integer] Return statistics in this region
        # @param type_id [Integer] Return statistics for this type
        def history(region_id:, type_id:)
          response = get_request("markets/#{region_id}/history",
            params: {
              type_id: type_id
            })

          Collection.from_response(response, type: Models::MarketHistory)
        end

        # @param region_id [Integer] Return orders in this region
        # @param order_type [String] Filter buy/sell orders. One of: "buy", "sell", "all". Default: "all"
        # @param type_id [Integer] Return orders only for this type. Default: nil (all types)
        # @param page [Integer] Which page of results to return. Default: 1
        def orders(region_id:, order_type: "all", type_id: nil, page: 1)
          response = get_request("markets/#{region_id}/orders",
            params: {
              order_type: order_type,
              type_id: type_id,
              page: page
            }.compact)

          Collection.from_response(response, type: Models::MarketOrder)
        end

        # @param region_id [Integer] An EVE region id
        # @param page [Integer] Which page of results to return. Default: 1
        def types(region_id:, page: 1)
          response = get_request("markets/#{region_id}/types",
            params: {
              page: page
            })

          Models::Types.new(body: response.body, headers: response.headers)
        end

        private

        def compatibility_date
          "2026-08-18"
        end
      end
    end
  end
end

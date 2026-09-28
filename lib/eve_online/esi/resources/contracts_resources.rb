# frozen_string_literal: true

module EveOnline
  module ESI
    module Resources
      class ContractsResources < Resource
        # @param contract_id [Integer] ID of a contract
        # @param page [Integer] Which page of results to return. Default: 1
        def public_bids(contract_id:, page: 1)
          response = get_request("contracts/public/bids/#{contract_id}",
            params: {
              page: page
            })

          Collection.from_response(response, type: Models::ContractBid)
        end

        # @param contract_id [Integer] ID of a contract
        # @param page [Integer] Which page of results to return. Default: 1
        def public_items(contract_id:, page: 1)
          response = get_request("contracts/public/items/#{contract_id}",
            params: {
              page: page
            })

          Collection.from_response(response, type: Models::ContractItem)
        end

        # @param region_id [Integer] An EVE region id
        # @param page [Integer] Which page of results to return. Default: 1
        def public(region_id:, page: 1)
          response = get_request("contracts/public/#{region_id}",
            params: {
              page: page
            })

          Collection.from_response(response, type: Models::PublicContract)
        end

        private

        def compatibility_date
          "2026-08-18"
        end
      end
    end
  end
end

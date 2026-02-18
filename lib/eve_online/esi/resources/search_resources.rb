# frozen_string_literal: true

module EveOnline
  module ESI
    module Resources
      class SearchResources < Resource
        # @param character_id [Integer] A character ID
        # @param categories [Array<String>] Type of entities to search for.
        #   Any: "agent", "alliance", "character", "constellation",
        #        "corporation", "faction", "inventory_type", "region",
        #        "solar_system", "station", "structure"
        # @param search [String] The string to search on
        # @param strict [Boolean] Whether the search should be a strict match. Default: false
        def search(character_id:, categories:, search:, strict: false)
          response = get_request("/characters/#{character_id}/search",
            params: {
              categories: categories,
              search: search,
              strict: strict
            })

          Models::Search.new(attributes: response.body, headers: response.headers)
        end
      end
    end
  end
end

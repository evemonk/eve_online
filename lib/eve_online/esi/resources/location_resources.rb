# frozen_string_literal: true

module EveOnline
  module ESI
    module Resources
      class LocationResources < Resource
        # @param id [Integer] A character ID
        def ship(id:)
          response = get_request("characters/#{id}/ship")

          Models::CharacterShip.new(attributes: response.body, headers: response.headers)
        end

        # @param id [Integer] A character ID
        def online(id:)
          response = get_request("characters/#{id}/online")

          Models::Online.new(attributes: response.body, headers: response.headers)
        end

        private

        def compatibility_date
          "2025-12-16"
        end
      end
    end
  end
end

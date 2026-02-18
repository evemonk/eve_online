# frozen_string_literal: true

module EveOnline
  module ESI
    module Resources
      class LocationResources < Resource
        # @param character_id [Integer] A character ID
        def ship(character_id:)
          response = get_request("characters/#{character_id}/ship")

          Models::CharacterShip.new(attributes: response.body, headers: response.headers)
        end

        private

        def compatibility_date
          "2025-12-16"
        end
      end
    end
  end
end

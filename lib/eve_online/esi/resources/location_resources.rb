# frozen_string_literal: true

module EveOnline
  module ESI
    module Resources
      class LocationResources < Resource
        # @param character_id [Integer] A character ID
        def ship(character_id:)
          response = get_request("characters/#{character_id}/ship")
        end
      end
    end
  end
end

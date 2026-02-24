# frozen_string_literal: true

module EveOnline
  module ESI
    module Resources
      class ClonesResources < Resource
        # @param character_id [Integer] The ID of the character
        def clones(character_id:)
          response = get_request("characters/#{character_id}/clones")

          Models::Clones.new(attributes: response.body, headers: response.headers)
        end

        # @param character_id [Integer] The ID of the character
        def implants(character_id:)
          response = get_request("characters/#{character_id}/implants")

          Models::Implants.new(body: response.body, headers: response.headers)
        end

        private

        def compatibility_date
          "2025-12-16"
        end
      end
    end
  end
end

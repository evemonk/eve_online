# frozen_string_literal: true

module EveOnline
  module ESI
    module Resources
      class SkillsResources < Resource
        # @param character_id [Integer] The ID of the character
        def attributes(character_id:)
          response = get_request("characters/#{character_id}/attributes")

          Models::Attributes.new(attributes: response.body, headers: response.headers)
        end

        # @param character_id [Integer] The ID of the character
        def skillqueue(character_id:)
          response = get_request("characters/#{character_id}/skillqueue")

          Collection.from_response(response, type: Models::SkillQueueEntry)
        end

        # @param character_id [Integer] The ID of the character
        def skills(character_id:)
          response = get_request("characters/#{character_id}/skills")

          Models::Skills.new(attributes: response.body, headers: response.headers)
        end

        private

        def compatibility_date
          "2025-12-16"
        end
      end
    end
  end
end

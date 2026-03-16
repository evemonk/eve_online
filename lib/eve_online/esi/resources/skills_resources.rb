# frozen_string_literal: true

module EveOnline
  module ESI
    module Resources
      class SkillsResources < Resource
        # @param id [Integer] The ID of the character
        def attributes(id:)
          response = get_request("characters/#{id}/attributes")

          Models::Attributes.new(attributes: response.body, headers: response.headers)
        end

        # @param id [Integer] The ID of the character
        def skillqueue(id:)
          response = get_request("characters/#{id}/skillqueue")

          Collection.from_response(response, type: Models::SkillQueueEntry)
        end

        # @param id [Integer] The ID of the character
        def skills(id:)
          response = get_request("characters/#{id}/skills")

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

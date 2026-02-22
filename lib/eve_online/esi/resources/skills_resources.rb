# frozen_string_literal: true

module EveOnline
  module ESI
    module Resources
      class SkillsResources < Resource
        def attributes(character_id:)
          response = get_request("characters/#{character_id}/attributes")

          Models::Attributes.new(attributes: response.body, headers: response.headers)
        end

        private

        def compatibility_date
          "2025-12-16"
        end
      end
    end
  end
end

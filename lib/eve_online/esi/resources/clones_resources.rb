# frozen_string_literal: true

module EveOnline
  module ESI
    module Resources
      class ClonesResources < Resource
        # @param id [Integer] The ID of the character
        def clones(id:)
          response = get_request("characters/#{id}/clones")

          Models::Clones.new(attributes: response.body, headers: response.headers)
        end

        # @param id [Integer] The ID of the character
        def implants(id:)
          response = get_request("characters/#{id}/implants")

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

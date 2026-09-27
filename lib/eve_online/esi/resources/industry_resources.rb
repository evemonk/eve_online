# frozen_string_literal: true

module EveOnline
  module ESI
    module Resources
      class IndustryResources < Resource
        def facilities
          response = get_request("industry/facilities")

          Collection.from_response(response, type: Models::IndustryFacility)
        end

        def systems
          response = get_request("industry/systems")

          Collection.from_response(response, type: Models::IndustrySystem)
        end

        private

        def compatibility_date
          "2026-08-18"
        end
      end
    end
  end
end

# frozen_string_literal: true

module EveOnline
  module ESI
    module Resources
      class IncursionsResources < Resource
        def list
          response = get_request("incursions")

          Collection.from_response(response, type: Models::Incursion)
        end

        private

        def compatibility_date
          "2026-08-18"
        end
      end
    end
  end
end

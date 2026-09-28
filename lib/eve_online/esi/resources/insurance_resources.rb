# frozen_string_literal: true

module EveOnline
  module ESI
    module Resources
      class InsuranceResources < Resource
        def prices
          response = get_request("insurance/prices")

          Collection.from_response(response, type: Models::InsurancePrice)
        end

        private

        def compatibility_date
          "2026-08-18"
        end
      end
    end
  end
end

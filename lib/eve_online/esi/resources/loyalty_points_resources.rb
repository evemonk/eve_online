# frozen_string_literal: true

module EveOnline
  module ESI
    module Resources
      class LoyaltyPointsResources < Resource
        # @param id [Integer] A character ID
        def loyalty_points(id:)
          response = get_request("characters/#{id}/loyalty/points")

          Collection.from_response(response, type: Models::LoyaltyPoint)
        end

        private

        def compatibility_date
          "2025-12-16"
        end
      end
    end
  end
end

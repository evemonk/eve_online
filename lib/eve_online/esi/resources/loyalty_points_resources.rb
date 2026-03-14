# frozen_string_literal: true

module EveOnline
  module ESI
    module Resources
      class LoyaltyPointsResources < Resource
        # @param id [Integer] A character ID
        def loyalty_points(id:)
          response = get_request("characters/#{id}/loyalty/points")
        end
      end
    end
  end
end

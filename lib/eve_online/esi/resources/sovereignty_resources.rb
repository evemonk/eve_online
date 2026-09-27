# frozen_string_literal: true

module EveOnline
  module ESI
    module Resources
      class SovereigntyResources < Resource
        def campaigns
          response = get_request("sovereignty/campaigns")

          Collection.from_response(response, type: Models::SovereigntyCampaign)
        end

        def systems
          response = get_request("sovereignty/systems")

          Models::SovereigntySystems.new(attributes: response.body, headers: response.headers)
        end

        private

        def compatibility_date
          "2026-08-18"
        end
      end
    end
  end
end

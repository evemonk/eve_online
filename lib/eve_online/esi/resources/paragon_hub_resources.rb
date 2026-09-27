# frozen_string_literal: true

module EveOnline
  module ESI
    module Resources
      class ParagonHubResources < Resource
        # @param after [String] Return records from after this cursor. Default: nil
        # @param before [String] Return records from before this cursor. Default: nil
        # @param limit [Integer] The amount of records to retrieve per request. Default: 10
        def skinr(after: nil, before: nil, limit: 10)
          response = get_request("paragon-hub/skinr",
            params: {
              after: after,
              before: before,
              limit: limit
            }.compact)

          Models::ParagonHubSkinrListings.new(attributes: response.body, headers: response.headers)
        end

        private

        def compatibility_date
          "2026-08-18"
        end
      end
    end
  end
end

# frozen_string_literal: true

module EveOnline
  module ESI
    module Resources
      class CorporationsResource < Resource
        # @param id [Integer] The ID of the corporation
        def retrieve(id:)
          response = get_request("corporations/#{id}")

          Models::Corporation.new(attributes: response.body, headers: response.headers)
        end

        private

        def compatibility_date
          "2025-12-16"
        end
      end
    end
  end
end

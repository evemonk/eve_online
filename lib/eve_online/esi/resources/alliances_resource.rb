# frozen_string_literal: true

module EveOnline
  module ESI
    module Resources
      class AlliancesResource < Resource
        def list
          response = get_request("alliances")

          Models::Alliances.new(body: response.body, headers: response.headers)
        end

        # @param id [Integer] The ID of the alliance
        def retrieve(id:)
          response = get_request("alliances/#{id}")

          Models::Alliance.new(attributes: response.body, headers: response.headers)
        end

        private

        def compatibility_date
          "2025-12-16"
        end
      end
    end
  end
end

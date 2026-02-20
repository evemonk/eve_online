# frozen_string_literal: true

module EveOnline
  module ESI
    module Resources
      class WarsResources < Resource
        # @param max_war_id [Integer] Only return wars with ID smaller than this. Default: nil
        def wars(max_war_id: nil)
          response = get_request("wars",
            params: {
              max_war_id: max_war_id
            }.compact)

          Models::Wars.new(body: response.body, headers: response.headers)
        end

        # @param war_id [Integer]
        def war(war_id:)
          response = get_request("wars/#{war_id}")

          Models::War.new(attributes: response.body, headers: response.headers)
        end

        private

        def compatibility_date
          "2025-12-16"
        end
      end
    end
  end
end

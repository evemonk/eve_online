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

        # @param war_id [Integer]
        # @param page [Integer] Which page of results to return. Default: 1
        def killmails(war_id:, page: 1)
          response = get_request("wars/#{war_id}/killmails",
            params: {
              page: page
            })

          Collection.from_response(response, type: Models::KillmailReference)
        end

        private

        def compatibility_date
          "2026-08-18"
        end
      end
    end
  end
end

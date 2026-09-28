# frozen_string_literal: true

module EveOnline
  module ESI
    module Resources
      class CorporationsResources < Resource
        # @param id [Integer] The ID of the corporation
        def retrieve(id:)
          response = get_request("corporations/#{id}")

          Models::Corporation.new(attributes: response.body, headers: response.headers)
        end

        def npc
          response = get_request("corporations/npccorps")

          Models::NpcCorporations.new(body: response.body, headers: response.headers)
        end

        # @param id [Integer] The ID of the corporation
        def alliance_history(id:)
          response = get_request("corporations/#{id}/alliancehistory")

          Collection.from_response(response, type: Models::CorporationAllianceHistory)
        end

        # @param id [Integer] The ID of the corporation
        def icons(id:)
          response = get_request("corporations/#{id}/icons")

          Models::CorporationIcon.new(attributes: response.body, headers: response.headers)
        end

        private

        def compatibility_date
          "2026-08-18"
        end
      end
    end
  end
end

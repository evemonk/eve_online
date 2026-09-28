# frozen_string_literal: true

module EveOnline
  module ESI
    module Resources
      class MilitaryCampaignsResources < Resource
        def list
          response = get_request("military-campaigns")

          Models::MilitaryCampaignsListing.new(attributes: response.body, headers: response.headers)
        end

        # @param id [String] The ID of the military campaign
        def retrieve(id:)
          response = get_request("military-campaigns/#{id}")

          Models::MilitaryCampaign.new(attributes: response.body, headers: response.headers)
        end

        # @param id [String] The ID of the military campaign
        # @param after [String] Return records from after this cursor. Default: nil
        # @param before [String] Return records from before this cursor. Default: nil
        # @param limit [Integer] The amount of records to retrieve per request. Default: 10
        def objectives(id:, after: nil, before: nil, limit: 10)
          response = get_request("military-campaigns/#{id}/objectives",
            params: {
              after: after,
              before: before,
              limit: limit
            }.compact)

          Models::MilitaryCampaignObjectivesListing.new(attributes: response.body, headers: response.headers)
        end

        # @param id [String] The ID of the military campaign
        # @param objective_id [String] The ID of the objective
        def objective(id:, objective_id:)
          response = get_request("military-campaigns/#{id}/objectives/#{objective_id}")

          Models::MilitaryCampaignObjective.new(attributes: response.body, headers: response.headers)
        end

        private

        def compatibility_date
          "2026-08-18"
        end
      end
    end
  end
end

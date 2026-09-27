# frozen_string_literal: true

module EveOnline
  module ESI
    module Resources
      class FreelanceJobsResources < Resource
        # @param after [String] Return records from after this cursor (mutually exclusive with `before`). Default: nil
        # @param before [String] Return records from before this cursor (mutually exclusive with `after`). Default: nil
        # @param limit [Integer] The amount of records to retrieve per request. Default: 10
        # @param corporation_id [Integer] Filter on corporation ID. Default: nil
        def list(after: nil, before: nil, limit: 10, corporation_id: nil)
          response = get_request("freelance-jobs",
            params: {
              after: after,
              before: before,
              limit: limit,
              corporation_id: corporation_id
            }.compact)

          Models::FreelanceJobsListing.new(attributes: response.body, headers: response.headers)
        end

        # @param id [String] The ID of the freelance job
        def retrieve(id:)
          response = get_request("freelance-jobs/#{id}")

          Models::FreelanceJobDetail.new(attributes: response.body, headers: response.headers)
        end

        private

        def compatibility_date
          "2026-08-18"
        end
      end
    end
  end
end

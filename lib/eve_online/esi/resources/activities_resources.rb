# frozen_string_literal: true

module EveOnline
  module ESI
    module Resources
      class ActivitiesResources < Resource
        def raidable_skyhooks
          response = get_request("skyhooks/raidable")

          Models::SkyhooksRaidableListing.new(attributes: response.body, headers: response.headers)
        end

        private

        def compatibility_date
          "2026-08-18"
        end
      end
    end
  end
end

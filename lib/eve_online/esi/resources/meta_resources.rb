# frozen_string_literal: true

module EveOnline
  module ESI
    module Resources
      class MetaResources < Resource
        def changelog
          response = get_request("meta/changelog")

          Models::MetaChangelog.new(attributes: response.body, headers: response.headers)
        end

        def compatibility_dates
          response = get_request("meta/compatibility-dates")

          Models::MetaCompatibilityDates.new(attributes: response.body, headers: response.headers)
        end

        def name
          response = get_request("meta/name")

          Models::MetaName.new(attributes: response.body, headers: response.headers)
        end

        def status
          response = get_request("meta/status")

          Models::MetaStatus.new(attributes: response.body, headers: response.headers)
        end

        private

        def compatibility_date
          "2026-08-18"
        end
      end
    end
  end
end

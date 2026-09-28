# frozen_string_literal: true

module EveOnline
  module ESI
    module Resources
      class ServerStatusResources < Resource
        def info
          response = get_request("status")

          Models::ServerStatus.new(attributes: response.body, headers: response.headers)
        end

        private

        def compatibility_date
          "2026-08-18"
        end
      end
    end
  end
end

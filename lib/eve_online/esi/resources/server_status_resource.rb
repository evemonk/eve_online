# frozen_string_literal: true

module EveOnline
  module ESI
    module Resources
      class ServerStatusResource < Resource
        def info
          Models::ServerStatus.new(get_request("status"))
        end

        def compatibility_date
          "2025-12-16"
        end
      end
    end
  end
end

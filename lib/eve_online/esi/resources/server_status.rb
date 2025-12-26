# frozen_string_literal: true

module EveOnline
  module ESI
    module Resources
      class ServerStatusResource < Resource
        def get
          Models::ServerStatus.new(get_request("server"))
        end
      end
    end
  end
end

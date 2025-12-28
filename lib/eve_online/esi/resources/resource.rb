# frozen_string_literal: true

module EveOnline
  module ESI
    module Resources
      class Resource
        attr_reader :client

        def initialize(client)
          @client = client
        end

        def get_request(url, params: {}, headers: {})
          client.connection.get(url, params, default_headers.merge(headers))
        end

        def default_headers
          h = {}

          h = h.merge(Authorization: token) if defined?(token)

          h
        end
      end
    end
  end
end

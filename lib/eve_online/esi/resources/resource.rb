# frozen_string_literal: true

module EveOnline
  module ESI
    module Resources
      class Resource
        attr_reader :client

        # @param client [EveOnline::ESI::Client]
        def initialize(client)
          @client = client
          @response = nil
        end

        # @param url [String] URL to get
        # @param params [Hash]
        # @param headers [Hash]
        def get_request(url, params: {}, headers: {})
          # client.connection.get(url, params, default_headers.merge(headers)).body

          client.connection.get(url, params, default_headers.merge(headers))
        end

        def default_headers
          h = {}

          # h = h.merge(Authorization: token) if defined?(token)
          h["User-Agent"] = user_agent
          h["Accept"] = "application/json"
          h["Accept-Language"] = client.language
          h["X-Tenant"] = client.tenant
          h["X-Compatibility-Date"] = compatibility_date if compatibility_date

          h
        end

        def compatibility_date
        end

        def user_agent
          "EveOnline API (https://github.com/evemonk/eve_online) v#{VERSION}"
        end
      end
    end
  end
end

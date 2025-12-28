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
          client.connection.get(url, params, default_headers.merge(headers)).body
        end

        def default_headers
          h = {}

          # h = h.merge(Authorization: token) if defined?(token)
          h.merge!("User-Agent" => user_agent)
          h.merge!("Accept" => "application/json")
          h.merge!("Accept-Language": client.language)
          h.merge!("X-Tenant" => client.tenant)
          h.merge!("X-Compatibility-Date" => compatibility_date) if compatibility_date

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

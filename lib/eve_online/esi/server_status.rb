# frozen_string_literal: true

require 'forwardable'

module EveOnline
  module ESI
    class ServerStatus < Base
      extend Forwardable

      API_ENDPOINT = 'https://esi.tech.ccp.is/v1/status/?datasource=tranquility'

      def_delegators :model, :as_json, :start_time, :players, :server_version, :vip

      def model
        Models::ServerStatus.new(response)
      end
      memoize :model

      def scope; end

      def url
        API_ENDPOINT
      end
    end
  end
end

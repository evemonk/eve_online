# frozen_string_literal: true

require 'forwardable'

module EveOnline
  module ESI
    class ServerStatus < Base
      extend Forwardable

      API_ENDPOINT = 'https://esi.evetech.net/v1/status/?datasource=%<datasource>s'

      def_delegators :model, :as_json, :start_time, :players, :server_version, :vip

      def model
        @model ||= Models::ServerStatus.new(response)
      end

      def scope; end

      def url
        format(API_ENDPOINT, datasource: datasource)
      end
    end
  end
end

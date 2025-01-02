# frozen_string_literal: true

require "forwardable"

module EveOnline
  module ESI
    class ServerStatus < Base
      extend Forwardable

      API_PATH = "/v2/status/"

      def_delegators :model, :as_json, :players, :server_version, :start_time, :vip

      def model
        @model ||= Models::ServerStatus.new(response)
      end

      def scope
      end

      def path
        API_PATH
      end
    end
  end
end

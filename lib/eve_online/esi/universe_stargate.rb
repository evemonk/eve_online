# frozen_string_literal: true

require "forwardable"

module EveOnline
  module ESI
    class UniverseStargate < Base
      extend Forwardable

      API_PATH = "/v1/universe/stargates/%<stargate_id>s/"

      attr_reader :stargate_id

      def initialize(options)
        super

        @stargate_id = options.fetch(:stargate_id)
      end

      def_delegators :model, :as_json, :name, :id, :system_id, :type_id,
        :destination_stargate_id, :destination_system_id, :position

      def model
        @model ||= Models::Stargate.new(response)
      end

      def scope
      end

      def path
        format(API_PATH, stargate_id: stargate_id)
      end
    end
  end
end

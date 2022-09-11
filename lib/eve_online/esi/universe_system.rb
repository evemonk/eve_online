# frozen_string_literal: true

require "forwardable"

module EveOnline
  module ESI
    class UniverseSystem < Base
      extend Forwardable

      API_PATH = "/v4/universe/systems/%<system_id>s/"

      attr_reader :system_id

      def initialize(options)
        super

        @system_id = options.fetch(:system_id)
      end

      def_delegators :model, :as_json, :constellation_id, :name,
        :security_class, :security_status, :star_id, :id, :position, :planets,
        :stargate_ids, :station_ids

      def model
        @model ||= Models::System.new(response)
      end

      def scope
      end

      def additional_query_params
        [:language]
      end

      def path
        format(API_PATH, system_id: system_id)
      end
    end
  end
end

# frozen_string_literal: true

require "forwardable"

module EveOnline
  module ESI
    class UniverseRegion < Base
      extend Forwardable

      API_PATH = "/v1/universe/regions/%<region_id>s/"

      attr_reader :region_id

      def initialize(options)
        super

        @region_id = options.fetch(:region_id)
      end

      def_delegators :model, :as_json, :description, :name, :id,
        :constellation_ids

      def model
        @model ||= Models::Region.new(response)
      end

      def scope
      end

      def additional_query_params
        [:language]
      end

      def path
        format(API_PATH, region_id: region_id)
      end
    end
  end
end

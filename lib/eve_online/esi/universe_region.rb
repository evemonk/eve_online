# frozen_string_literal: true

require 'forwardable'

module EveOnline
  module ESI
    class UniverseRegion < Base
      extend Forwardable

      API_PATH = '/v1/universe/regions/%<region_id>s/?datasource=%<datasource>s'

      attr_reader :id

      def initialize(options)
        super

        @id = options.fetch(:id)
      end

      def_delegators :model, :as_json, :constellations, :description, :name,
                     :region_id

      def model
        @model ||= Models::Region.new(response)
      end

      def scope; end

      def url
        format("#{ API_HOST }#{ API_PATH }", region_id: id, datasource: datasource)
      end
    end
  end
end

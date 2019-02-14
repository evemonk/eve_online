# frozen_string_literal: true

require 'forwardable'

module EveOnline
  module ESI
    class UniverseConstellation < Base
      extend Forwardable

      API_PATH = '/v1/universe/constellations/%<constellation_id>s/?datasource=%<datasource>s'

      attr_reader :id

      def initialize(options)
        super

        @id = options.fetch(:id)
      end

      def_delegators :model, :as_json, :constellation_id, :name, :region_id,
                     :system_ids, :position

      def model
        @model ||= Models::Constellation.new(response)
      end

      def scope; end

      def url
        format("#{ API_HOST }#{ API_PATH }", constellation_id: id, datasource: datasource)
      end
    end
  end
end

# frozen_string_literal: true

require 'forwardable'

module EveOnline
  module ESI
    class UniverseConstellation < Base
      extend Forwardable

      API_ENDPOINT = 'https://esi.evetech.net/v1/universe/constellations/%<constellation_id>s/?datasource=%<datasource>s&language=en-us'

      attr_reader :id

      def initialize(options)
        super

        @id = options.fetch(:id)
      end

      def_delegators :model, :as_json, :constellation_id, :name, :position_x,
                     :position_y, :position_z, :region_id, :systems

      def model
        Models::Constellation.new(response)
      end
      memoize :model

      def scope; end

      def url
        format(API_ENDPOINT, constellation_id: id, datasource: datasource)
      end
    end
  end
end

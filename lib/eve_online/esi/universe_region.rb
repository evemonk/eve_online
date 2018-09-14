# frozen_string_literal: true

require 'forwardable'

module EveOnline
  module ESI
    class UniverseRegion < Base
      extend Forwardable

      API_ENDPOINT = 'https://esi.evetech.net/v1/universe/regions/%<region_id>s/?datasource=%<datasource>s&language=en-us'

      attr_reader :id

      def initialize(options)
        super

        @id = options.fetch(:id)
      end

      def_delegators :model, :as_json, :constellations, :description, :name,
                     :region_id

      def model
        Models::Region.new(response)
      end
      memoize :model

      def scope; end

      def url
        format(API_ENDPOINT, region_id: id, datasource: datasource)
      end
    end
  end
end

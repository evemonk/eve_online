# frozen_string_literal: true

require 'forwardable'

module EveOnline
  module ESI
    class UniverseStargate < Base
      extend Forwardable

      include ResponseWithEtag

      API_ENDPOINT = 'https://esi.evetech.net/v1/universe/stargates/%<stargate_id>s/?datasource=%<datasource>s'

      attr_reader :id

      def initialize(options)
        super

        @id = options.fetch(:id)
      end

      def_delegators :model, :as_json, :name, :stargate_id, :system_id,
                     :type_id, :destination, :position, :etag

      def model
        @model ||= Models::Stargate.new(response_with_etag)
      end

      def scope; end

      def url
        format(API_ENDPOINT, stargate_id: id, datasource: datasource)
      end
    end
  end
end

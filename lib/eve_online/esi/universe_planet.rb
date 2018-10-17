# frozen_string_literal: true

require 'forwardable'

module EveOnline
  module ESI
    class UniversePlanet < Base
      extend Forwardable

      API_ENDPOINT = 'https://esi.evetech.net/v1/universe/planets/%<planet_id>s/?datasource=%<datasource>s'

      attr_reader :id

      def initialize(options = {})
        super

        @id = options.fetch(:id)
      end

      def_delegators :model, :as_json, :name, :planet_id, :system_id,
                     :type_id, :position

      def model
        @model ||= Models::Planet.new(response)
      end

      def scope; end

      def url
        format(API_ENDPOINT, planet_id: id, datasource: datasource)
      end
    end
  end
end

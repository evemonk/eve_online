# frozen_string_literal: true

require 'forwardable'

module EveOnline
  module ESI
    class UniverseAsteroidBelt < Base
      extend Forwardable

      API_ENDPOINT = 'https://esi.evetech.net/v1/universe/asteroid_belts/%<asteroid_belt_id>s/?datasource=%<datasource>s'

      attr_reader :id

      def initialize(options)
        super

        @id = options.fetch(:id)
      end

      def_delegators :model, :as_json, :name, :system_id, :position

      def model
        @model ||= Models::AsteroidBelt.new(response)
      end

      def scope; end

      def url
        format(API_ENDPOINT, asteroid_belt_id: id, datasource: datasource)
      end
    end
  end
end

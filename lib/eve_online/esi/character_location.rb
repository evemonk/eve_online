# frozen_string_literal: true

require 'forwardable'

module EveOnline
  module ESI
    class CharacterLocation < Base
      extend Forwardable

      API_ENDPOINT = 'https://esi.evetech.net/v1/characters/%<character_id>s/location/?datasource=%<datasource>s'

      attr_reader :character_id

      def initialize(options)
        super

        @character_id = options.fetch(:character_id)
      end

      def_delegators :model, :as_json, :solar_system_id, :station_id,
                     :structure_id

      def model
        @model ||= Models::CharacterLocation.new(response)
      end

      def scope
        'esi-location.read_location.v1'
      end

      def url
        format(API_ENDPOINT, character_id: character_id, datasource: datasource)
      end
    end
  end
end

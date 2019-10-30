# frozen_string_literal: true

require 'forwardable'

module EveOnline
  module ESI
    class CharacterShip < Base
      extend Forwardable

      API_PATH = '/v1/characters/%<character_id>s/ship/'

      attr_reader :character_id

      def initialize(options)
        super

        @character_id = options.fetch(:character_id)
      end

      def_delegators :model, :as_json, :ship_item_id, :ship_name, :ship_type_id

      def model
        @model ||= Models::CharacterShip.new(response)
      end

      def scope
        'esi-location.read_ship_type.v1'
      end

      def path
        format(API_PATH, character_id: character_id)
      end
    end
  end
end

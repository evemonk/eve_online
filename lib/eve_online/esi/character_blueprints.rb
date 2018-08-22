# frozen_string_literal: true

module EveOnline
  module ESI
    class CharacterBlueprints < Base
      API_ENDPOINT = 'https://esi.tech.ccp.is/v2/characters/%<character_id>s/blueprints/?datasource=%<datasource>s&page=1'

      attr_reader :character_id

      def initialize(options)
        super

        @character_id = options[:character_id]
      end

      def blueprints
        output = []
        response.each do |blueprint|
          output << Models::Blueprint.new(blueprint)
        end
        output
      end
      memoize :blueprints

      def scope
        'esi-characters.read_blueprints.v1'
      end

      def url
        format(API_ENDPOINT, character_id: character_id, datasource: datasource)
      end
    end
  end
end

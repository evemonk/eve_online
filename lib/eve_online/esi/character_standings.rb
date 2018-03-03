# frozen_string_literal: true

module EveOnline
  module ESI
    class CharacterStandings < Base
      API_ENDPOINT = 'https://esi.tech.ccp.is/v1/characters/%<character_id>s/standings/?datasource=tranquility'.freeze

      attr_reader :character_id

      def initialize(options)
        super

        @character_id = options[:character_id]
      end

      def standings
        output = []
        response.each do |standing|
          output << Models::Standing.new(standing)
        end
        output
      end
      memoize :standings

      def scope
        'esi-characters.read_standings.v1'
      end

      def url
        format(API_ENDPOINT, character_id: character_id)
      end
    end
  end
end

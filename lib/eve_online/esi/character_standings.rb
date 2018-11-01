# frozen_string_literal: true

module EveOnline
  module ESI
    class CharacterStandings < Base
      API_ENDPOINT = 'https://esi.evetech.net/v1/characters/%<character_id>s/standings/?datasource=%<datasource>s'

      attr_reader :character_id

      def initialize(options)
        super

        @character_id = options.fetch(:character_id)
      end

      def standings
        @standings ||=
          begin
            output = []
            response.each do |standing|
              output << Models::Standing.new(standing)
            end
            output
          end
      end

      def scope
        'esi-characters.read_standings.v1'
      end

      def url
        format(API_ENDPOINT, character_id: character_id, datasource: datasource)
      end
    end
  end
end

# frozen_string_literal: true

module EveOnline
  module ESI
    class CharacterStandings < Base
      API_PATH = '/v1/characters/%<character_id>s/standings/'

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

      def path
        format("#{ API_PATH }", character_id: character_id)
      end
    end
  end
end

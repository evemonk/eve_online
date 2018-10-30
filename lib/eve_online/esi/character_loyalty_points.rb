# frozen_string_literal: true

module EveOnline
  module ESI
    class CharacterLoyaltyPoints < Base
      API_ENDPOINT = 'https://esi.evetech.net/v1/characters/%<character_id>s/loyalty/points/?datasource=%<datasource>s'

      attr_reader :character_id

      def initialize(options)
        super

        @character_id = options.fetch(:character_id)
      end

      def loyalty_points
        output = []
        response.each do |lp|
          output << Models::LoyaltyPoint.new(lp)
        end
        output
      end

      def scope
        'esi-characters.read_loyalty.v1'
      end

      def url
        format(API_ENDPOINT, character_id: character_id, datasource: datasource)
      end
    end
  end
end

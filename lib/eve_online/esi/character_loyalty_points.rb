# frozen_string_literal: true

module EveOnline
  module ESI
    class CharacterLoyaltyPoints < Base
      API_ENDPOINT = 'https://esi.tech.ccp.is/v1/characters/%<character_id>s/loyalty/points/?datasource=tranquility'

      attr_reader :character_id

      def initialize(options)
        super

        @character_id = options[:character_id]
      end

      def loyalty_points
        output = []
        response.each do |lp|
          output << Models::LoyaltyPoint.new(lp)
        end
        output
      end
      memoize :loyalty_points

      def scope
        'esi-characters.read_loyalty.v1'
      end

      def url
        format(API_ENDPOINT, character_id: character_id)
      end
    end
  end
end

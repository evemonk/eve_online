module EveOnline
  module ESI
    class CharacterLoyaltyPoints < Base
      API_ENDPOINT = 'https://esi.tech.ccp.is/v1/characters/%s/loyalty/points/?datasource=tranquility'.freeze

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
        API_ENDPOINT % character_id
      end
    end
  end
end

# frozen_string_literal: true

module EveOnline
  module ESI
    class CharacterLoyaltyPoints < Base
      API_PATH = '/v1/characters/%<character_id>s/loyalty/points/'

      attr_reader :character_id

      def initialize(options)
        super

        @character_id = options.fetch(:character_id)
      end

      def loyalty_points
        @loyalty_points ||=
          begin
            output = []
            response.each do |lp|
              output << Models::LoyaltyPoint.new(lp)
            end
            output
          end
      end

      def scope
        'esi-characters.read_loyalty.v1'
      end

      def path
        format("#{ API_PATH }", character_id: character_id)
      end
    end
  end
end

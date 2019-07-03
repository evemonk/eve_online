# frozen_string_literal: true

module EveOnline
  module ESI
    class CharacterOrders < Base
      API_PATH = '/v2/characters/%<character_id>s/orders/'

      attr_reader :character_id

      def initialize(options)
        super

        @character_id = options.fetch(:character_id)
      end

      def orders
        @orders ||=
          begin
            output = []
            response.each do |order|
              output << Models::CharacterOrder.new(order)
            end
            output
          end
      end

      def scope
        'esi-markets.read_character_orders.v1'
      end

      def path
        format("#{ API_PATH }", character_id: character_id)
      end
    end
  end
end

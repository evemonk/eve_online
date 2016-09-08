module EveOnline
  module Characters
    # https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_marketorders.html
    class MarketOrders < BaseXML
      API_ENDPOINT = 'https://api.eveonline.com/char/MarketOrders.xml.aspx'.freeze

      ACCESS_MASK = 4_096

      attr_reader :key_id, :v_code, :character_id, :order_id

      def initialize(key_id, v_code, character_id, order_id = nil)
        super()
        @key_id = key_id
        @v_code = v_code
        @character_id = character_id
        @order_id = order_id
      end

      def orders
        case row
        when Hash
          [MarketOrder.new(row)]
        when Array
          output = []
          row.each do |order|
            output << MarketOrder.new(order)
          end
          output
        else
          raise ArgumentError
        end
      end
      memoize :orders

      def url
        output = "#{ API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }&characterID=#{ character_id }"
        output = "#{ output }&orderID=#{ order_id }" if order_id
        output
      end

      private

      def rowset
        result.fetch('rowset')
      end
      memoize :rowset

      def row
        rowset.fetch('row')
      end
      memoize :row
    end
  end
end

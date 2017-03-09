module EveOnline
  module XML
    # https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/index.html
    class CorporationMarketOrders < BaseXML
      API_ENDPOINT = 'https://api.eveonline.com/corp/MarketOrders.xml.aspx'.freeze

      ACCESS_MASK = 4_096

      attr_reader :key_id, :v_code, :character_id, :order_id

      def initialize(key_id, v_code, options = {})
        super()
        @key_id = key_id
        @v_code = v_code
        @character_id = options.fetch(:character_id, nil)
        @order_id = options.fetch(:order_id, nil)
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
        output = "#{ API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }"
        output = "#{ output }&characterID=#{ character_id }" if character_id
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

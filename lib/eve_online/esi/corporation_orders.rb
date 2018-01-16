module EveOnline
  module ESI
    class CorporationOrders < Base
      API_ENDPOINT = 'https://esi.tech.ccp.is/v1/corporations/%<corporation_id>s/orders/?datasource=tranquility&page=1'.freeze

      attr_reader :corporation_id

      def initialize(options)
        super

        @corporation_id = options[:corporation_id]
      end

      def orders
        output = []
        response.each do |order|
          output << Models::CorporationOrder.new(order)
        end
        output
      end
      memoize :orders

      def scope
        'esi-markets.read_corporation_orders.v1'
      end

      # TODO: add roles support
      # def roles
      #   ['Accountant', 'Trader']
      # end

      def url
        format(API_ENDPOINT, corporation_id: corporation_id)
      end
    end
  end
end

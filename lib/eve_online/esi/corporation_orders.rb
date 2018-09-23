# frozen_string_literal: true

module EveOnline
  module ESI
    class CorporationOrders < Base
      API_ENDPOINT = 'https://esi.evetech.net/v3/corporations/%<corporation_id>s/orders/?datasource=%<datasource>s&page=%<page>s'

      attr_reader :corporation_id, :page

      def initialize(options)
        super

        @corporation_id = options.fetch(:corporation_id)
        @page = options.fetch(:page, 1)
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
        format(API_ENDPOINT, corporation_id: corporation_id, datasource: datasource, page: page)
      end
    end
  end
end

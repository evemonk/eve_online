# frozen_string_literal: true

module EveOnline
  module ESI
    class CorporationOrders < Base
      API_PATH = "/v3/corporations/%<corporation_id>s/orders/"

      attr_reader :corporation_id, :page

      def initialize(options)
        super

        @corporation_id = options.fetch(:corporation_id)
        @page = options.fetch(:page, 1)
      end

      def orders
        @orders ||=
          begin
            output = []
            response.each do |order|
              output << Models::CorporationOrder.new(order)
            end
            output
          end
      end

      def scope
        "esi-markets.read_corporation_orders.v1"
      end

      def roles
        ["Accountant", "Trader"]
      end

      def additional_query_params
        [:page]
      end

      def path
        format(API_PATH, corporation_id: corporation_id)
      end
    end
  end
end

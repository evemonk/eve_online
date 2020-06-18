# frozen_string_literal: true

module EveOnline
  module ESI
    class PublicContract < Base
      API_PATH = "/v1/contracts/public/items/%<contract_id>s/"

      attr_reader :contract_id, :page

      def initialize(options)
        super

        @contract_id = options.fetch(:contract_id)
        @page = options.fetch(:page, 1)
      end

      def items
        @items ||=
          begin
            output = []
            response.each do |item|
              output << Models::PublicContractItem.new(item)
            end
            output
          end
      end

      def scope
      end

      def additional_query_params
        [:page]
      end

      def path
        format(API_PATH, contract_id: contract_id)
      end
    end
  end
end

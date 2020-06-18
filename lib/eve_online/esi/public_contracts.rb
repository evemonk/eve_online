# frozen_string_literal: true

module EveOnline
  module ESI
    class PublicContracts < Base
      API_PATH = "/v1/contracts/public/%<region_id>s/"

      attr_reader :region_id, :page

      def initialize(options)
        super

        @region_id = options.fetch(:region_id)
        @page = options.fetch(:page, 1)
      end

      def contracts
        @contracts ||=
          begin
            output = []
            response.each do |contract|
              output << Models::PublicContract.new(contract)
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
        format(API_PATH, region_id: region_id)
      end
    end
  end
end

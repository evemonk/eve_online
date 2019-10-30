# frozen_string_literal: true

module EveOnline
  module ESI
    class MarketHistory < Base
      API_PATH = '/v1/markets/%<region_id>s/history/'

      attr_reader :region_id, :type_id

      def initialize(options)
        super

        @region_id = options.fetch(:region_id)
        @type_id = options.fetch(:type_id)
      end

      def history
        @history ||=
          begin
            output = []
            response.each do |history|
              output << Models::MarketHistory.new(history)
            end
            output
          end
      end

      def scope; end

      def additional_query_params
        [:type_id]
      end

      def path
        format(API_PATH, region_id: region_id)
      end
    end
  end
end

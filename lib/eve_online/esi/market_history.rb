# frozen_string_literal: true

module EveOnline
  module ESI
    class MarketHistory < Base
      API_ENDPOINT = 'https://esi.tech.ccp.is/v1/markets/%<region_id>s/history/?datasource=tranquility&type_id=%<type_id>s'.freeze

      attr_reader :region_id, :type_id

      def initialize(options)
        super

        @region_id = options[:region_id]
        @type_id = options[:type_id]
      end

      def history
        output = []
        response.each do |history|
          output << Models::MarketHistory.new(history)
        end
        output
      end
      memoize :history

      def scope; end

      def url
        format(API_ENDPOINT, region_id: region_id, type_id: type_id)
      end
    end
  end
end

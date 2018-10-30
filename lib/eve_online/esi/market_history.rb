# frozen_string_literal: true

module EveOnline
  module ESI
    class MarketHistory < Base
      API_ENDPOINT = 'https://esi.evetech.net/v1/markets/%<region_id>s/history/?datasource=%<datasource>s&type_id=%<type_id>s'

      attr_reader :region_id, :type_id

      def initialize(options)
        super

        @region_id = options.fetch(:region_id)
        @type_id = options.fetch(:type_id)
      end

      def history
        output = []
        response.each do |history|
          output << Models::MarketHistory.new(history)
        end
        output
      end

      def scope; end

      def url
        format(API_ENDPOINT, region_id: region_id, type_id: type_id, datasource: datasource)
      end
    end
  end
end

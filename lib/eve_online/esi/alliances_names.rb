# frozen_string_literal: true

module EveOnline
  module ESI
    class AlliancesNames < Base
      API_ENDPOINT = 'https://esi.tech.ccp.is/v2/alliances/names/?alliance_ids=%<alliance_ids>s&datasource=tranquility'.freeze

      attr_reader :alliance_ids

      def initialize(options)
        super

        @alliance_ids = options[:alliance_ids]
      end

      def alliances
        output = []
        response.each do |alliance|
          output << Models::AllianceShort.new(alliance)
        end
        output
      end
      memoize :alliances

      def scope; end

      def url
        format(API_ENDPOINT, alliance_ids: alliance_ids.join(','))
      end
    end
  end
end

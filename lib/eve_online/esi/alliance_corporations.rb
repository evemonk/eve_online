# frozen_string_literal: true

module EveOnline
  module ESI
    class AllianceCorporations < Base
      API_ENDPOINT = 'https://esi.tech.ccp.is/v1/alliances/%<alliance_id>s/corporations/?datasource=tranquility'

      attr_reader :alliance_id

      def initialize(options)
        super

        @alliance_id = options[:alliance_id]
      end

      def corporations
        response
      end

      def scope; end

      def url
        format(API_ENDPOINT, alliance_id: alliance_id)
      end
    end
  end
end

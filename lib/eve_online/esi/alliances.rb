module EveOnline
  module ESI
    class Alliances < Base
      API_ENDPOINT = 'https://esi.tech.ccp.is/v1/alliances/?datasource=tranquility'.freeze

      def alliances
        response
      end

      def scope; end

      def url
        API_ENDPOINT
      end
    end
  end
end

# frozen_string_literal: true

module EveOnline
  module ESI
    class Alliances < Base
      API_ENDPOINT = 'https://esi.tech.ccp.is/v1/alliances/?datasource=%<datasource>s'

      def alliances
        response
      end

      def scope; end

      def url
        format(API_ENDPOINT, datasource: datasource)
      end
    end
  end
end

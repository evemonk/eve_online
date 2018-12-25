# frozen_string_literal: true

module EveOnline
  module ESI
    class Alliances < Base
      API_ENDPOINT = 'https://esi.evetech.net/v1/alliances/?datasource=%<datasource>s'

      def alliance_ids
        response
      end

      def etag
        current_etag
      end

      def scope; end

      def url
        format(API_ENDPOINT, datasource: datasource)
      end
    end
  end
end

# frozen_string_literal: true

module EveOnline
  module ESI
    class UniverseTypes < Base
      API_ENDPOINT = 'https://esi.evetech.net/v1/universe/types/?datasource=%<datasource>s&page=1'

      def universe_types_ids
        response
      end

      def scope; end

      def url
        format(API_ENDPOINT, datasource: datasource)
      end
    end
  end
end

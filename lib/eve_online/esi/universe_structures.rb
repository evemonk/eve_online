# frozen_string_literal: true

module EveOnline
  module ESI
    class UniverseStructures < Base
      API_ENDPOINT = 'https://esi.evetech.net/v1/universe/structures/?datasource=%<datasource>s'

      def structure_ids
        response
      end

      def scope; end

      def url
        format(API_ENDPOINT, datasource: datasource, page: page)
      end
    end
  end
end

# frozen_string_literal: true

module EveOnline
  module ESI
    class UniverseConstellations < Base
      API_ENDPOINT = 'https://esi.evetech.net/v1/universe/constellations/?datasource=%<datasource>s'

      def constellation_ids
        response
      end

      def scope; end

      def url
        format(API_ENDPOINT, datasource: datasource)
      end
    end
  end
end

# frozen_string_literal: true

module EveOnline
  module ESI
    class UniverseRegions < Base
      API_ENDPOINT = 'https://esi.evetech.net/v1/universe/regions/?datasource=%<datasource>s'

      def universe_regions_ids
        response
      end

      def scope; end

      def url
        format(API_ENDPOINT, datasource: datasource)
      end
    end
  end
end

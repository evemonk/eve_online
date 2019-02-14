# frozen_string_literal: true

module EveOnline
  module ESI
    class UniverseRegions < Base
      API_PATH = '/v1/universe/regions/?datasource=%<datasource>s'

      def universe_region_ids
        response
      end

      def scope; end

      def url
        format("#{ API_HOST }#{ API_PATH }", datasource: datasource)
      end
    end
  end
end

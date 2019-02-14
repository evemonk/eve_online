# frozen_string_literal: true

module EveOnline
  module ESI
    class UniverseConstellations < Base
      API_PATH = '/v1/universe/constellations/?datasource=%<datasource>s'

      def constellation_ids
        response
      end

      def scope; end

      def url
        format("#{ API_HOST }#{ API_PATH }", datasource: datasource)
      end
    end
  end
end

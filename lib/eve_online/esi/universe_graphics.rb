# frozen_string_literal: true

module EveOnline
  module ESI
    class UniverseGraphics < Base
      API_PATH = '/v1/universe/graphics/?datasource=%<datasource>s'

      def graphic_ids
        response
      end

      def scope; end

      def url
        format("#{ API_HOST }#{ API_PATH }", datasource: datasource)
      end
    end
  end
end

# frozen_string_literal: true

module EveOnline
  module ESI
    class UniverseStructures < Base
      API_PATH = '/v1/universe/structures/?datasource=%<datasource>s'

      def structure_ids
        response
      end

      def scope; end

      def url
        format("#{ API_HOST }#{ API_PATH }", datasource: datasource, page: page)
      end
    end
  end
end

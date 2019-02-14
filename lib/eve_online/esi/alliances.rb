# frozen_string_literal: true

module EveOnline
  module ESI
    class Alliances < Base
      API_PATH = '/v1/alliances/?datasource=%<datasource>s'

      def alliance_ids
        response
      end

      def scope; end

      def url
        format("#{ API_HOST }#{ API_PATH }", datasource: datasource)
      end
    end
  end
end

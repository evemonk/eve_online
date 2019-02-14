# frozen_string_literal: true

module EveOnline
  module ESI
    class UniverseSystems < Base
      API_PATH = '/v1/universe/systems/?datasource=%<datasource>s'

      def universe_system_ids
        response
      end

      def scope; end

      def url
        format("#{ API_HOST }#{ API_PATH }", datasource: datasource)
      end
    end
  end
end

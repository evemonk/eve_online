# frozen_string_literal: true

module EveOnline
  module ESI
    class Wars < Base
      API_ENDPOINT = 'https://esi.evetech.net/v1/wars/?datasource=%<datasource>s'

      def wars_ids
        response
      end

      def scope; end

      def url
        format(API_ENDPOINT, datasource: datasource)
      end
    end
  end
end

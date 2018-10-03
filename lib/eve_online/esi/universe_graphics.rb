# frozen_string_literal: true

module EveOnline
  module ESI
    class UniverseGraphics < Base
      API_ENDPOINT = 'https://esi.evetech.net/v1/universe/graphics/?datasource=%<datasource>s'

      def graphic_ids
        response
      end

      def scope; end

      def url
        format(API_ENDPOINT, datasource: datasource)
      end
    end
  end
end

# frozen_string_literal: true

module EveOnline
  module ESI
    class UniverseSystems < Base
      API_ENDPOINT = 'https://esi.evetech.net/v1/universe/systems/?datasource=%<datasource>s'

      def universe_systems_ids
        response
      end

      def scope; end

      def url
        format(API_ENDPOINT, datasource: datasource)
      end
    end
  end
end

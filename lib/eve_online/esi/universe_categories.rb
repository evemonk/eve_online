# frozen_string_literal: true

module EveOnline
  module ESI
    class UniverseCategories < Base
      API_ENDPOINT = 'https://esi.evetech.net/v1/universe/categories/?datasource=%<datasource>s'

      def category_ids
        response
      end

      def scope; end

      def url
        format(API_ENDPOINT, datasource: datasource)
      end
    end
  end
end

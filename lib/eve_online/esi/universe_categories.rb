# frozen_string_literal: true

module EveOnline
  module ESI
    class UniverseCategories < Base
      API_PATH = "/v1/universe/categories/"

      def category_ids
        response
      end

      def scope
      end

      def path
        API_PATH
      end
    end
  end
end

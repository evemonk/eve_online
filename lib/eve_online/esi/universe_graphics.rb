# frozen_string_literal: true

module EveOnline
  module ESI
    class UniverseGraphics < Base
      API_PATH = '/v1/universe/graphics/'

      def graphic_ids
        response
      end

      def scope; end

      def path
        API_PATH
      end
    end
  end
end

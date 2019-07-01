# frozen_string_literal: true

module EveOnline
  module ESI
    class Alliances < Base
      API_PATH = '/v1/alliances/'

      def alliance_ids
        response
      end

      def scope; end

      def path
        API_PATH
      end
    end
  end
end

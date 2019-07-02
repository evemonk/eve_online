# frozen_string_literal: true

module EveOnline
  module ESI
    class UniverseSystems < Base
      API_PATH = '/v1/universe/systems/'

      def universe_system_ids
        response
      end

      def scope; end

      def path
        API_PATH
      end
    end
  end
end

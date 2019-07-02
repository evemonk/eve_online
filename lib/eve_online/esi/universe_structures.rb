# frozen_string_literal: true

module EveOnline
  module ESI
    class UniverseStructures < Base
      API_PATH = '/v1/universe/structures/'

      attr_reader :filter

      def initialize(options = {})
        super

        @filter = options.fetch(:filter, nil)
      end

      def structure_ids
        response
      end

      def scope; end

      def additation_query_params
        [:filter]
      end

      def path
        API_PATH
      end
    end
  end
end

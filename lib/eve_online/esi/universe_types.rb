# frozen_string_literal: true

module EveOnline
  module ESI
    class UniverseTypes < Base
      API_PATH = "/v1/universe/types/"

      attr_reader :page

      def initialize(options = {})
        super

        @page = options.fetch(:page, 1)
      end

      def universe_type_ids
        response
      end

      def scope
      end

      def additional_query_params
        [:page]
      end

      def path
        API_PATH
      end
    end
  end
end

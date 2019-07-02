# frozen_string_literal: true

module EveOnline
  module ESI
    class UniverseGroups < Base
      API_PATH = '/v1/universe/groups/'

      attr_reader :page

      def initialize(options = {})
        super

        @page = options.fetch(:page, 1)
      end

      def group_ids
        response
      end

      def scope; end

      def additation_query_params
        [:page]
      end

      def path
        API_PATH
      end
    end
  end
end

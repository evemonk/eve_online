# frozen_string_literal: true

module EveOnline
  module ESI
    class UniverseGroups < Base
      API_PATH = '/v1/universe/groups/?datasource=%<datasource>s&page=%<page>s'

      attr_reader :page

      def initialize(options = {})
        super

        @page = options.fetch(:page, 1)
      end

      def group_ids
        response
      end

      def scope; end

      def url
        format("#{ API_HOST }#{ API_PATH }", datasource: datasource, page: page)
      end
    end
  end
end

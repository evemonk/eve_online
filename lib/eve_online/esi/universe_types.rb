# frozen_string_literal: true

module EveOnline
  module ESI
    class UniverseTypes < Base
      API_PATH = '/v1/universe/types/?datasource=%<datasource>s&page=%<page>s'

      attr_reader :page

      def initialize(options = {})
        super

        @page = options.fetch(:page, 1)
      end

      def universe_type_ids
        response
      end

      def scope; end

      def url
        format("#{ API_HOST }#{ API_PATH }", datasource: datasource, page: page)
      end
    end
  end
end

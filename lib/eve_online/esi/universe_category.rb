# frozen_string_literal: true

module EveOnline
  module ESI
    class UniverseCategory < Base
      API_ENDPOINT = 'https://esi.evetech.net/v1/universe/categories/%<category_id>s/?datasource=%<datasource>s'

      attr_reader :id

      def initialize(options)
        super

        @id = options.fetch(:id)
      end

      def scope; end

      def url
        format(API_ENDPOINT, category_id: id, datasource: datasource)
      end
    end
  end
end

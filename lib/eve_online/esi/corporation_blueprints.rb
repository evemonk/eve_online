# frozen_string_literal: true

module EveOnline
  module ESI
    class CorporationBlueprints < Base
      API_PATH = '/v2/corporations/%<corporation_id>s/blueprints/?datasource=%<datasource>s&page=%<page>s'

      attr_reader :corporation_id, :page

      def initialize(options)
        super

        @corporation_id = options.fetch(:corporation_id)
        @page = options.fetch(:page, 1)
      end

      def blueprints
        @blueprints ||=
          begin
            output = []
            response.each do |blueprint|
              output << Models::Blueprint.new(blueprint)
            end
            output
          end
      end

      def scope
        'esi-corporations.read_blueprints.v1'
      end

      def roles
        ['Director']
      end

      def url
        format("#{ API_HOST }#{ API_PATH }", corporation_id: corporation_id, datasource: datasource, page: page)
      end
    end
  end
end

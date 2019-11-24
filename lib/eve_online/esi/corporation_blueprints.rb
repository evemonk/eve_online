# frozen_string_literal: true

module EveOnline
  module ESI
    class CorporationBlueprints < Base
      API_PATH = "/v2/corporations/%<corporation_id>s/blueprints/"

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
        "esi-corporations.read_blueprints.v1"
      end

      def roles
        ["Director"]
      end

      def additional_query_params
        [:page]
      end

      def path
        format(API_PATH, corporation_id: corporation_id)
      end
    end
  end
end

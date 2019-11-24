# frozen_string_literal: true

module EveOnline
  module ESI
    class CorporationAssets < Base
      API_PATH = "/v3/corporations/%<corporation_id>s/assets/"

      attr_reader :corporation_id, :page

      def initialize(options)
        super

        @corporation_id = options.fetch(:corporation_id)
        @page = options.fetch(:page, 1)
      end

      def assets
        @assets ||=
          begin
            output = []
            response.each do |asset|
              output << Models::Asset.new(asset)
            end
            output
          end
      end

      def scope
        "esi-assets.read_corporation_assets.v1"
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

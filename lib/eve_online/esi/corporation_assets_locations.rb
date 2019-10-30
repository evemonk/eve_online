# frozen_string_literal: true

module EveOnline
  module ESI
    class CorporationAssetsLocations < Base
      API_PATH = '/v2/corporations/%<corporation_id>s/assets/locations/'

      attr_reader :corporation_id, :item_ids

      def initialize(options)
        super

        @corporation_id = options.fetch(:corporation_id)
        @item_ids = options.fetch(:item_ids)
      end

      def assets_locations
        @assets_locations ||=
          begin
            output = []
            response.each do |asset_location|
              output << Models::AssetLocation.new(asset_location)
            end
            output
          end
      end

      def http_method
        'Post'
      end

      def payload
        item_ids.to_json
      end

      def scope
        'esi-assets.read_corporation_assets.v1'
      end

      def roles
        ['Director']
      end

      def etag
        raise NotImplementedError
      end

      def path
        format(API_PATH, corporation_id: corporation_id)
      end
    end
  end
end

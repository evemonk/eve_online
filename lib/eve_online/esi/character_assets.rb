# frozen_string_literal: true

module EveOnline
  module ESI
    class CharacterAssets < Base
      API_PATH = '/v3/characters/%<character_id>s/assets/'

      attr_reader :character_id, :page

      def initialize(options)
        super

        @character_id = options.fetch(:character_id)
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
        'esi-assets.read_assets.v1'
      end

      def additional_query_params
        [:page]
      end

      def path
        format(API_PATH, character_id: character_id)
      end
    end
  end
end

# frozen_string_literal: true

module EveOnline
  module ESI
    class CharacterAssets < Base
      API_ENDPOINT = 'https://esi.tech.ccp.is/v3/characters/%<character_id>s/assets/?datasource=tranquility&page=1'.freeze

      attr_reader :character_id

      def initialize(options)
        super

        @character_id = options[:character_id]
      end

      def assets
        output = []
        response.each do |asset|
          output << Models::Asset.new(asset)
        end
        output
      end
      memoize :assets

      def scope
        'esi-assets.read_assets.v1'
      end

      def url
        format(API_ENDPOINT, character_id: character_id)
      end
    end
  end
end

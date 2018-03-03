# frozen_string_literal: true

module EveOnline
  module ESI
    class Factions < Base
      API_ENDPOINT = 'https://esi.tech.ccp.is/v2/universe/factions/?datasource=tranquility&language=en-us'.freeze

      def factions
        output = []
        response.each do |faction|
          output << Models::Faction.new(faction)
        end
        output
      end
      memoize :factions

      def scope; end

      def url
        API_ENDPOINT
      end
    end
  end
end

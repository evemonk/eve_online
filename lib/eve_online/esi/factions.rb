# frozen_string_literal: true

module EveOnline
  module ESI
    class Factions < Base
      API_ENDPOINT = 'https://esi.evetech.net/v2/universe/factions/?datasource=%<datasource>s'

      def factions
        @factions ||=
          begin
            output = []
            response.each do |faction|
              output << Models::Faction.new(faction)
            end
            output
          end
      end

      def scope; end

      def url
        format(API_ENDPOINT, datasource: datasource)
      end
    end
  end
end

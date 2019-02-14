# frozen_string_literal: true

module EveOnline
  module ESI
    class UniverseFactions < Base
      API_PATH = '/v2/universe/factions/?datasource=%<datasource>s'

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
        format("#{ API_HOST }#{ API_PATH }", datasource: datasource)
      end
    end
  end
end

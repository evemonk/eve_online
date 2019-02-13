# frozen_string_literal: true

module EveOnline
  module ESI
    class UniverseRaces < Base
      API_PATH = '/v1/universe/races/?datasource=%<datasource>s'

      def races
        @races ||=
          begin
            output = []
            response.each do |race|
              output << Models::Race.new(race)
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

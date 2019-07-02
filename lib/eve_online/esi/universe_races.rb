# frozen_string_literal: true

module EveOnline
  module ESI
    class UniverseRaces < Base
      API_PATH = '/v1/universe/races/'

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

      def additation_query_params
        [:language]
      end

      def path
        API_PATH
      end
    end
  end
end

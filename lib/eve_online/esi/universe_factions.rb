# frozen_string_literal: true

module EveOnline
  module ESI
    class UniverseFactions < Base
      API_PATH = '/v2/universe/factions/'

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

      def additation_query_params
        [:language]
      end

      def path
        API_PATH
      end
    end
  end
end

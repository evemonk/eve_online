# frozen_string_literal: true

module EveOnline
  module ESI
    class Races < Base
      API_ENDPOINT = 'https://esi.evetech.net/v1/universe/races/?datasource=%<datasource>s'

      def races
        output = []
        response.each do |race|
          output << Models::Race.new(race)
        end
        output
      end

      def scope; end

      def url
        format(API_ENDPOINT, datasource: datasource)
      end
    end
  end
end

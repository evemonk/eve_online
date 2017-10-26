module EveOnline
  module ESI
    class Races < Base
      API_ENDPOINT = 'https://esi.tech.ccp.is/v1/universe/races/?datasource=tranquility&language=en-us'.freeze

      def races
        output = []
        response.each do |race|
          output << Models::Race.new(race)
        end
        output
      end
      memoize :races

      def scope; end

      def url
        API_ENDPOINT
      end
    end
  end
end

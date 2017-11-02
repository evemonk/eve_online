module EveOnline
  module ESI
    class CharacterBlueprints < Base
      API_ENDPOINT = 'https://esi.tech.ccp.is/v2/characters/%s/blueprints/?datasource=tranquility&page=1'.freeze


      attr_reader :character_id

      def initialize(options)
        super

        @character_id = options[:character_id]
      end

      def blueprints
        output = []
        response.each do |blueprint|
          output << Models::Blueprint.new(blueprint)
        end
        output
      end
      memoize :blueprints

      def scope
        'esi-characters.read_blueprints.v1'
      end

      def url
        API_ENDPOINT % character_id
      end
    end
  end
end

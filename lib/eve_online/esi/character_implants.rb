module EveOnline
  module ESI
    class CharacterImplants < Base
      API_ENDPOINT = 'https://esi.tech.ccp.is/v1/characters/%s/implants/?datasource=tranquility'.freeze

      attr_reader :character_id

      def initialize(options)
        super

        @character_id = options[:character_id]
      end

      def implants
        response
      end

      def scope
        'esi-clones.read_implants.v1'
      end

      def url
        API_ENDPOINT % character_id
      end
    end
  end
end

module EveOnline
  module ESI
    class CharacterOnline < Base
      API_ENDPOINT = 'https://esi.tech.ccp.is/v2/characters/%s/online/?datasource=tranquility'.freeze

      attr_reader :character_id

      def initialize(options)
        super

        @character_id = options[:character_id]
      end

      def scope
        'esi-location.read_online.v1'
      end

      def url
        API_ENDPOINT % character_id
      end
    end
  end
end

# frozen_string_literal: true

module EveOnline
  module ESI
    class CharacterImplants < Base
      API_ENDPOINT = 'https://esi.tech.ccp.is/v1/characters/%<character_id>s/implants/?datasource=%<datasource>s'

      attr_reader :character_id

      def initialize(options)
        super

        @character_id = options.fetch(:character_id)
      end

      def implants
        response
      end

      def scope
        'esi-clones.read_implants.v1'
      end

      def url
        format(API_ENDPOINT, character_id: character_id, datasource: datasource)
      end
    end
  end
end

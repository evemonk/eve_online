module EveOnline
  module ESI
    module Characters
      class Character < Base
        API_ENDPOINT = 'https://esi.tech.ccp.is/latest/characters/%s/?datasource=tranquility'.freeze

        attr_reader :character_id

        def initialize(character_id)
          super()
          @character_id = character_id
        end

        def url
          API_ENDPOINT % character_id
        end
      end
    end
  end
end

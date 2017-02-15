module EveOnline
  module ESI
    module Skills
      class Skills < Base
        API_ENDPOINT = 'https://esi.tech.ccp.is/latest/characters/%s/skills/?datasource=tranquility'.freeze

        attr_reader :character_id

        def initialize(token, character_id)
          super(token)
          @character_id = character_id
        end

        def scope
          'esi-skills.read_skills.v1'
        end

        def url
          API_ENDPOINT % character_id
        end
      end
    end
  end
end

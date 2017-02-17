module EveOnline
  module ESI
    class CharacterSkills < Base
      API_ENDPOINT = 'https://esi.tech.ccp.is/latest/characters/%s/skills/?datasource=tranquility'.freeze

      attr_reader :character_id

      def initialize(token, character_id)
        super(token)
        @character_id = character_id
      end

      def as_json
        {
          total_sp: total_sp,
          skills: skills
        }
      end

      def total_sp
        response.fetch('total_sp')
      end

      def skills
        response.fetch('skills')
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

module EveOnline
  module ESI
    class CharacterSkills < Base
      API_ENDPOINT = 'https://esi.tech.ccp.is/v4/characters/%<character_id>s/skills/?datasource=tranquility'.freeze

      attr_reader :character_id

      def initialize(options)
        super

        @character_id = options[:character_id]
      end

      def as_json
        {
          total_sp: total_sp,
          unallocated_sp: unallocated_sp
        }
      end

      def total_sp
        response['total_sp']
      end

      def unallocated_sp
        response['unallocated_sp']
      end

      def skills
        output = []
        response.fetch('skills').each do |skill|
          output << Models::Skill.new(skill)
        end
        output
      end
      memoize :skills

      def scope
        'esi-skills.read_skills.v1'
      end

      def url
        format(API_ENDPOINT, character_id: character_id)
      end
    end
  end
end

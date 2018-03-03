# frozen_string_literal: true

module EveOnline
  module ESI
    class CharacterSkillQueue < Base
      API_ENDPOINT = 'https://esi.tech.ccp.is/v2/characters/%<character_id>s/skillqueue/?datasource=tranquility'.freeze

      attr_reader :character_id

      def initialize(options)
        super

        @character_id = options[:character_id]
      end

      def skills
        output = []
        response.each do |skill|
          output << Models::SkillQueueEntry.new(skill)
        end
        output
      end
      memoize :skills

      def scope
        'esi-skills.read_skillqueue.v1'
      end

      def url
        format(API_ENDPOINT, character_id: character_id)
      end
    end
  end
end

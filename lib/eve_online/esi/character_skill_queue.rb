# frozen_string_literal: true

module EveOnline
  module ESI
    class CharacterSkillQueue < Base
      API_PATH = "/v2/characters/%<character_id>s/skillqueue/"

      attr_reader :character_id

      def initialize(options)
        super

        @character_id = options.fetch(:character_id)
      end

      def skills
        @skills ||=
          begin
            output = []
            response.each do |skill|
              output << Models::SkillQueueEntry.new(skill)
            end
            output
          end
      end

      def scope
        "esi-skills.read_skillqueue.v1"
      end

      def path
        format(API_PATH, character_id: character_id)
      end
    end
  end
end

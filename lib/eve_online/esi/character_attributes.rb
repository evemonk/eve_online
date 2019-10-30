# frozen_string_literal: true

require 'forwardable'

module EveOnline
  module ESI
    class CharacterAttributes < Base
      extend Forwardable

      API_PATH = '/v1/characters/%<character_id>s/attributes/'

      attr_reader :character_id

      def initialize(options)
        super

        @character_id = options.fetch(:character_id)
      end

      def_delegators :model, :as_json, :accrued_remap_cooldown_date,
                     :bonus_remaps, :charisma, :intelligence, :last_remap_date,
                     :memory, :perception, :willpower

      def model
        @model ||= Models::Attributes.new(response)
      end

      def scope
        'esi-skills.read_skills.v1'
      end

      def path
        format(API_PATH, character_id: character_id)
      end
    end
  end
end

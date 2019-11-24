# frozen_string_literal: true

require "forwardable"

module EveOnline
  module ESI
    class CharacterFatigue < Base
      extend Forwardable

      API_PATH = "/v1/characters/%<character_id>s/fatigue/"

      attr_reader :character_id

      def initialize(options)
        super

        @character_id = options.fetch(:character_id)
      end

      def_delegators :model, :as_json, :jump_fatigue_expire_date,
        :last_jump_date, :last_update_date

      def model
        @model ||= Models::Fatigue.new(response)
      end

      def scope
        "esi-characters.read_fatigue.v1"
      end

      def path
        format(API_PATH, character_id: character_id)
      end
    end
  end
end

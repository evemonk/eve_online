require 'forwardable'

module EveOnline
  module ESI
    class CharacterAttributes < Base
      extend Forwardable

      API_ENDPOINT = 'https://esi.tech.ccp.is/v1/characters/%s/attributes/?datasource=tranquility'.freeze

      attr_reader :character_id

      def initialize(options)
        super

        @character_id = options[:character_id]
      end

      def_delegators :model, :as_json, :charisma, :intelligence, :memory,
                     :perception, :willpower, :bonus_remaps,
                     :last_remap_date, :accrued_remap_cooldown_date

      def model
        Models::Attributes.new(response)
      end
      memoize :model

      def scope
        'esi-skills.read_skills.v1'
      end

      def url
        API_ENDPOINT % character_id
      end
    end
  end
end

# frozen_string_literal: true

require 'forwardable'

module EveOnline
  module ESI
    class Character < Base
      extend Forwardable

      API_ENDPOINT = 'https://esi.tech.ccp.is/v4/characters/%<character_id>s/?datasource=%<datasource>s'

      attr_reader :character_id

      def initialize(options)
        super

        @character_id = options.fetch(:character_id)
      end

      def_delegators :model, :as_json, :alliance_id, :ancestry_id, :birthday,
                     :bloodline_id, :corporation_id, :description, :faction_id,
                     :gender, :name, :race_id, :security_status

      def model
        Models::Character.new(response)
      end
      memoize :model

      def scope; end

      def url
        format(API_ENDPOINT, character_id: character_id, datasource: datasource)
      end
    end
  end
end

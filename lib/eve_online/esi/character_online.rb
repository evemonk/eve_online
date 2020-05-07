# frozen_string_literal: true

require "forwardable"

module EveOnline
  module ESI
    class CharacterOnline < Base
      extend Forwardable

      API_PATH = "/v3/characters/%<character_id>s/online/"

      attr_reader :character_id

      def initialize(options)
        super

        @character_id = options.fetch(:character_id)
      end

      def_delegators :model, :as_json, :last_login, :last_logout, :logins,
        :online

      def model
        @model ||= Models::Online.new(response)
      end

      def scope
        "esi-location.read_online.v1"
      end

      def path
        format(API_PATH, character_id: character_id)
      end
    end
  end
end

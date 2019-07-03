# frozen_string_literal: true

require 'forwardable'

module EveOnline
  module ESI
    class Character < Base
      extend Forwardable

      API_PATH = '/v4/characters/%<character_id>s/'

      attr_reader :character_id

      def initialize(options)
        super

        @character_id = options.fetch(:character_id)
      end

      def_delegators :model, :as_json, :alliance_id, :ancestry_id, :birthday,
                     :bloodline_id, :corporation_id, :description, :faction_id,
                     :gender, :name, :race_id, :security_status, :title

      def model
        @model ||= Models::Character.new(response)
      end

      def scope; end

      def path
        format("#{ API_PATH }", character_id: character_id)
      end
    end
  end
end

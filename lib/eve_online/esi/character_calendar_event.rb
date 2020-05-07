# frozen_string_literal: true

module EveOnline
  module ESI
    class CharacterCalendarEvent < Base
      extend Forwardable

      API_PATH = "/v4/characters/%<character_id>s/calendar/%<event_id>s/"

      attr_reader :character_id, :event_id

      def initialize(options)
        super

        @character_id = options.fetch(:character_id)
        @event_id = options.fetch(:event_id)
      end

      def_delegators :model, :as_json, :date, :duration, :importance,
        :owner_id, :owner_name, :owner_type, :event_response, :text, :title

      def model
        @model ||= Models::EventDetails.new(response)
      end

      def scope
        "esi-calendar.read_calendar_events.v1"
      end

      def path
        format(API_PATH, character_id: character_id, event_id: event_id)
      end
    end
  end
end

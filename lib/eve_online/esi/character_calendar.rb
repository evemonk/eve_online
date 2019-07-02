# frozen_string_literal: true

module EveOnline
  module ESI
    class CharacterCalendar < Base
      API_PATH = '/v1/characters/%<character_id>s/calendar/'

      attr_reader :character_id, :from_event

      def initialize(options)
        super

        @character_id = options.fetch(:character_id)
        @from_event = options.fetch(:from_event, nil)
      end

      def events
        @events ||=
          begin
            output = []
            response.each do |event|
              output << Models::Event.new(event)
            end
            output
          end
      end

      def scope
        'esi-calendar.read_calendar_events.v1'
      end

      def additation_query_params
        [:from_event]
      end

      def path
        format("#{ API_PATH }", character_id: character_id)
      end
    end
  end
end

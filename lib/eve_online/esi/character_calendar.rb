# frozen_string_literal: true

module EveOnline
  module ESI
    class CharacterCalendar < Base
      API_PATH = '/v1/characters/%<character_id>s/calendar/?datasource=%<datasource>s'

      attr_reader :character_id

      def initialize(options)
        super

        @character_id = options.fetch(:character_id)
        # TODO:
        # @from_event =
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

      def url
        format("#{ API_HOST }#{ API_PATH }", character_id: character_id, datasource: datasource)
      end
    end
  end
end

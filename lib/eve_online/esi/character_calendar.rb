# frozen_string_literal: true

module EveOnline
  module ESI
    class CharacterCalendar < Base
      API_ENDPOINT = 'https://esi.tech.ccp.is/v1/characters/%<character_id>s/calendar/?datasource=%<datasource>s'

      attr_reader :character_id

      def initialize(options)
        super

        @character_id = options[:character_id]
      end

      def events
        output = []
        response.each do |event|
          output << Models::Event.new(event)
        end
        output
      end
      memoize :events

      def scope
        'esi-calendar.read_calendar_events.v1'
      end

      def url
        format(API_ENDPOINT, character_id: character_id, datasource: datasource)
      end
    end
  end
end

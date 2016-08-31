module EveOnline
  module Characters
    # https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/character/char_calendareventattendees.html
    class CalendarEventAttendees < BaseXML
      API_ENDPOINT = 'https://api.eveonline.com/char/CalendarEventAttendees.xml.aspx'.freeze

      attr_reader :key_id, :v_code, :character_id, :event_id

      def initialize(key_id, v_code, character_id, event_id)
        super()
        @key_id = key_id
        @v_code = v_code
        @character_id = character_id
        @event_id = event_id
      end

      def access_mask_bit
        3
      end

      def url
        "#{ API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }&characterID=#{ character_id }&eventIDs=#{ event_id }"
      end
    end
  end
end

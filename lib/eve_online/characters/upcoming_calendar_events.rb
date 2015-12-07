module EveOnline
  module Characters
    # http://wiki.eve-id.net/APIv2Char_UpcomingCalendarEvents_XML
    class UpcomingCalendarEvents < Base
      API_ENDPOINT = 'https://api.eveonline.com/char/UpcomingCalendarEvents.xml.aspx'

      attr_reader :key_id, :v_code, :character_id

      def initialize(key_id, v_code, character_id)
        super()
        @key_id = key_id
        @v_code = v_code
        @character_id = character_id
      end

      def events
        case row
        when Hash
          [EveOnline::Event.new(row)]
        when Array
          output = []
          row.each do |event|
            output << EveOnline::Event.new(event)
          end
          output
        else
          raise ArgumentError
        end
      end

      def row
        rowset.fetch('row')
      end

      def rowset
        result.fetch('rowset')
      end

      def url
        "#{ API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }&characterID=#{ character_id }"
      end
    end
  end
end

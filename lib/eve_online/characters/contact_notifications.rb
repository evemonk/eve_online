module EveOnline
  module Characters
    # https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/character/char_contactnotifications.html
    class ContactNotifications < Base
      API_ENDPOINT = 'https://api.eveonline.com/char/ContactNotifications.xml.aspx'.freeze

      attr_reader :key_id, :v_code, :character_id

      def initialize(key_id, v_code, character_id)
        super()
        @key_id = key_id
        @v_code = v_code
        @character_id = character_id
      end

      def url
        "#{ API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }&characterID=#{ character_id }"
      end
    end
  end
end

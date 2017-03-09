module EveOnline
  module XML
    # https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_killmails.html
    class CharacterKillMails < BaseXML
      API_ENDPOINT = 'https://api.eveonline.com/char/KillMails.xml.aspx'.freeze

      ACCESS_MASK = 256

      attr_reader :key_id, :v_code, :character_id

      def initialize(key_id, v_code, character_id)
        super()
        @key_id = key_id
        @v_code = v_code
        @character_id = character_id
        # TODO: @from_id
        # TODO: row_count
      end

      def url
        "#{ API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }&characterID=#{ character_id }"
      end
    end
  end
end

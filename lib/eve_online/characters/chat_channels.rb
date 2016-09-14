module EveOnline
  module Characters
    # https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_chatchannels.html
    class ChatChannels < BaseXML
      API_ENDPOINT = 'https://api.eveonline.com/char/ChatChannels.xml.aspx'.freeze

      ACCESS_MASK = 536_870_912

      attr_reader :key_id, :v_code, :character_id

      def initialize(key_id, v_code, options = {})
        super()
        @key_id = key_id
        @v_code = v_code
        @character_id = options.fetch(:character_id, nil)
      end

      def url
        output = "#{ API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }"
        output = "#{ output }&characterID=#{ character_id }" if character_id
        output
      end
    end
  end
end

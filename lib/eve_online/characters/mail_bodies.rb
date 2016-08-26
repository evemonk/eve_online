module EveOnline
  module Characters
    # https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_mailbodies.html
    class MailBodies < BaseXML
      API_ENDPOINT = 'https://api.eveonline.com/char/MailBodies.xml.aspx'.freeze

      attr_reader :key_id, :v_code, :character_id, :ids

      def initialize(key_id, v_code, character_id, ids)
        super()
        @key_id = key_id
        @v_code = v_code
        @character_id = character_id
        @ids = ids
      end

      def escaped_ids
        @escaped_ids ||= URI.escape(ids.join(','))
      end

      def url
        "#{ API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }&characterID=#{ character_id }&IDs=#{ escaped_ids }"
      end
    end
  end
end

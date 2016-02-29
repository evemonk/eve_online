module EveOnline
  module Characters
    # https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/char_assetlist/
    class AssetList < Base
      API_ENDPOINT = 'https://api.eveonline.com/char/AssetList.xml.aspx'

      attr_reader :key_id, :v_code, :character_id, :flat

      def initialize(key_id, v_code, character_id, flat = 1)
        super()
        @key_id = key_id
        @v_code = v_code
        @character_id = character_id
        @flat = flat
      end

      def url
        "#{ API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }&characterID=#{ character_id }&flat=#{ flat }"
      end
    end
  end
end

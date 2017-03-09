module EveOnline
  module XML
    # https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_planetarypins.html
    class CharacterPlanetaryPins < BaseXML
      API_ENDPOINT = 'https://api.eveonline.com/char/PlanetaryPins.xml.aspx'.freeze

      ACCESS_MASK = 2

      attr_reader :key_id, :v_code, :character_id, :planet_id

      def initialize(key_id, v_code, character_id, planet_id)
        super()
        @key_id = key_id
        @v_code = v_code
        @character_id = character_id
        @planet_id = planet_id
      end

      def url
        "#{ API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }&characterID=#{ character_id }&planetID=#{ planet_id }"
      end
    end
  end
end

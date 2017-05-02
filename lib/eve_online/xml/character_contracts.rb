module EveOnline
  module XML
    # https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_contracts.html
    class CharacterContracts < Base
      API_ENDPOINT = 'https://api.eveonline.com/char/Contracts.xml.aspx'.freeze

      ACCESS_MASK = 67_108_864

      # attr_reader :key_id, :v_code, :character_id, :contract_id
      attr_reader :key_id, :v_code, :character_id

      # def initialize(key_id, v_code, character_id, contract_id = nil)
      def initialize(key_id, v_code, character_id)
        super()
        @key_id = key_id
        @v_code = v_code
        @character_id = character_id
      end

      def url
        # TODO: add support for contract_id
        "#{ API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }&characterID=#{ character_id }"
      end
    end
  end
end

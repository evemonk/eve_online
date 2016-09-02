module EveOnline
  module Characters
    # https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_walletjournal.html
    class WalletJournal < BaseXML
      API_ENDPOINT = 'https://api.eveonline.com/char/WalletJournal.xml.aspx'.freeze

      ACCESS_MASK = 2097152

      attr_reader :key_id, :v_code, :character_id #, :from_id, :row_count

      def initialize(key_id, v_code, character_id) #, options = {})
        super()
        @key_id = key_id
        @v_code = v_code
        @character_id = character_id
        # @from_id = options.fetch(:from_id, nil)
        # @row_count = options.fetch(:row_count, nil)
      end

      def url
        "#{ API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }&characterID=#{ character_id }"
        # "#{ API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }&characterID=#{ character_id }&rowCount=#{ row_count }"
      end
    end
  end
end

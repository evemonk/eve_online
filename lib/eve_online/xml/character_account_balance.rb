module EveOnline
  module XML
    # https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/character/char_accountbalance.html
    class CharacterAccountBalance < BaseXML
      API_ENDPOINT = 'https://api.eveonline.com/char/AccountBalance.xml.aspx'.freeze

      ACCESS_MASK = 1

      attr_reader :key_id, :v_code, :character_id

      def initialize(key_id, v_code, options = {})
        super()
        @key_id = key_id
        @v_code = v_code
        @character_id = options.fetch(:character_id, nil)
      end

      def as_json
        {
          account_id: account_id,
          account_key: account_key,
          balance: balance,
          current_time: current_time,
          cached_until: cached_until
        }
      end

      def account_id
        row.fetch('@accountID').to_i
      end

      def account_key
        row.fetch('@accountKey').to_i
      end

      def balance
        row.fetch('@balance').to_f
      end

      def url
        output = "#{ API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }"
        output = "#{ output }&characterID=#{ character_id }" if character_id
        output
      end

      private

      def rowset
        result.fetch('rowset')
      end
      memoize :rowset

      def row
        rowset.fetch('row')
      end
      memoize :row
    end
  end
end

module EveOnline
  module Characters
    # https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/character/char_accountbalance.html
    class AccountBalance < BaseXML
      API_ENDPOINT = 'https://api.eveonline.com/char/AccountBalance.xml.aspx'.freeze

      ACCESS_MASK = 1

      attr_reader :key_id, :v_code, :character_id

      def initialize(key_id, v_code, character_id)
        super()
        @key_id = key_id
        @v_code = v_code
        @character_id = character_id
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
        @account_id ||= row.fetch('@accountID').to_i
      end

      def account_key
        @account_key ||= row.fetch('@accountKey').to_i
      end

      def balance
        @balance ||= row.fetch('@balance').to_f
      end

      def url
        "#{ API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }&characterID=#{ character_id }"
      end

      private

      def rowset
        @rowset ||= result.fetch('rowset')
      end

      def row
        @row ||= rowset.fetch('row')
      end
    end
  end
end

module EveOnline
  module Characters
    # http://wiki.eve-id.net/APIv2_Char_AccountBalance_XML
    class AccountBalance < Base
      API_ENDPOINT = 'https://api.eveonline.com/char/AccountBalance.xml.aspx'

      attr_reader :key_id, :v_code, :character_id

      def initialize(key_id, v_code, character_id)
        super()
        @key_id = key_id
        @v_code = v_code
        @character_id = character_id
      end

      # def as_json(*args)
      #   {
      #     account_id: account_id,
      #     account_key: account_key,
      #     balance: balance,
      #     current_time: current_time,
      #     cached_until: cached_until
      #   }
      # end

      def account_id
        row.fetch('@accountID').to_i
      end

      def account_key
        row.fetch('@accountKey').to_i
      end

      def balance
        row.fetch('@balance')
      end

      def row
        rowset.fetch('row')
      end

      def rowset
        result.fetch('rowset')
      end

      def version
        eveapi.fetch('@version').to_i
      end

      def url
        "#{ API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }&characterID=#{ character_id }"
      end
    end
  end
end

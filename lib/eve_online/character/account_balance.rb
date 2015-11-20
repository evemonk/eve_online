module EveOnline
  module Character
    # http://wiki.eve-id.net/APIv2_Char_AccountBalance_XML
    class AccountBalance < Base
      API_ENDPOINT = 'https://api.eveonline.com/char/AccountBalance.xml.aspx'

      def current_time
        # TODO: time in "(GMT) Monrovia, Reykjavik".
        eveapi.fetch('currentTime')
      end

      def account_id
        row.fetch('@accountID').to_i
      end

      def account_key
        row.fetch('@accountKey')
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

      def cached_until
        eveapi.fetch('cachedUntil')
      end

      def version
        eveapi.fetch('@version').to_i
      end

      def result
        eveapi.fetch('result')
      end

      def eveapi
        response.fetch('eveapi')
      end

      def url
        "#{ API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }"
      end
    end
  end
end

module EveOnline
  module Account
    # http://wiki.eve-id.net/APIv2_Account_APIKeyInfo_XML
    class ApiKeyInfo < Base
      API_ENDPOINT = 'https://api.eveonline.com/account/APIKeyInfo.xml.aspx'

      def character_id
        row.fetch('@characterID').to_i
      end

      def character_name
        row.fetch('@characterName')
      end

      def corporation_id
        row.fetch('@corporationID').to_i
      end

      def corporation_name
        row.fetch('@corporationName')
      end

      def alliance_id
        row.fetch('@allianceID').to_i
      end

      def alliance_name
        row.fetch('@allianceName')
      end

      def faction_id
        row.fetch('@factionID').to_i
      end

      def faction_name
        row.fetch('@factionName')
      end

      def row
        rowset.fetch('row')
      end

      def rowset
        key.fetch('rowset')
      end

      def expires
        key.fetch('@expires')
      end

      def type
        key.fetch('@type')
      end

      def access_mask
        key.fetch('@accessMask')
      end

      def key
        result.fetch('key')
      end

      def current_time
        # TODO: time in "(GMT) Monrovia, Reykjavik".
        eveapi.fetch('currentTime')
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

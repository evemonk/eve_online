module EveOnline
  module Account
    # http://wiki.eve-id.net/APIv2_Account_Characters_XML
    class Characters < Base
      API_ENDPOINT = 'https://api.eveonline.com/account/Characters.xml.aspx'

      def current_time
        eveapi.fetch('currentTime')
      end

      def cached_until
        eveapi.fetch('cachedUntil')
      end

      def version
        eveapi.fetch('@version').to_i
      end

      def name
        row.fetch('@name')
      end

      def character_id
        row.fetch('@characterID').to_i
      end

      def corporation_name
        row.fetch('@corporationName')
      end

      def corporation_id
        row.fetch('@corporationID').to_i
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
        result.fetch('rowset')
      end

      def result
        eveapi.fetch('result')
      end

      def eveapi
        response.fetch('eveapi')
      end

      def url
        "#{ API_ENDPOINT}?keyID=#{ key_id }&vCode=#{ v_code }"
      end
    end
  end
end

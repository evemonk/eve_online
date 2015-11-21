module EveOnline
  module Account
    # http://wiki.eve-id.net/APIv2_Account_AccountStatus_XML
    class Status < Base
      API_ENDPOINT = 'https://api.eveonline.com/account/AccountStatus.xml.aspx'

      def as_json
        {
          current_time: current_time,
          paid_until: paid_until,
          create_date: create_date,
          logon_count: logon_count,
          logon_minutes: logon_minutes,
          cached_until: cached_until
        }
      end

      def paid_until
        # TODO: time in "(GMT) Monrovia, Reykjavik".
        result.fetch('paidUntil')
      end

      def create_date
        # TODO: time in "(GMT) Monrovia, Reykjavik".
        result.fetch('createDate')
      end

      def logon_count
        result.fetch('logonCount').to_i
      end

      def logon_minutes
        result.fetch('logonMinutes').to_i
      end

      def version
        eveapi.fetch('@version').to_i
      end

      def result
        eveapi.fetch('result')
      end

      def url
        "#{ API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }"
      end
    end
  end
end

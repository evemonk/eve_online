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
        @paid_until ||= begin
          ActiveSupport::TimeZone['UTC'].parse(result.fetch('paidUntil'))
        end
      end

      def create_date
        @create_date ||= begin
          ActiveSupport::TimeZone['UTC'].parse(result.fetch('createDate'))
        end
      end

      def logon_count
        @logon_count ||= result.fetch('logonCount').to_i
      end

      def logon_minutes
        @logon_minutes ||= result.fetch('logonMinutes').to_i
      end

      def version
        @version ||= eveapi.fetch('@version').to_i
      end

      def url
        "#{ API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }"
      end
    end
  end
end

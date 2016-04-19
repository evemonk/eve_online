module EveOnline
  module Account
    # https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/account/account_accountstatus.html
    class Status < BaseXML
      API_ENDPOINT = 'https://api.eveonline.com/account/AccountStatus.xml.aspx'.freeze

      attr_reader :key_id, :v_code

      def initialize(key_id, v_code)
        super()
        @key_id = key_id
        @v_code = v_code
      end

      def as_json(*args)
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
        @paid_until ||= ActiveSupport::TimeZone['UTC'].parse(result.fetch('paidUntil'))
      end

      def create_date
        @create_date ||= ActiveSupport::TimeZone['UTC'].parse(result.fetch('createDate'))
      end

      def logon_count
        @logon_count ||= result.fetch('logonCount').to_i
      end

      def logon_minutes
        @logon_minutes ||= result.fetch('logonMinutes').to_i
      end

      def url
        "#{ API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }"
      end
    end
  end
end

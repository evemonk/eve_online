require 'active_support/time'

module EveOnline
  module XML
    module Models
      class AccountStatus
        attr_reader :options

        def initialize(options)
          @options = options
        end

        def as_json
          {
            paid_until: paid_until,
            create_date: create_date,
            logon_count: logon_count,
            logon_minutes: logon_minutes
          }
        end

        def paid_until
          parse_datetime_with_timezone(options.fetch('paidUntil'))
        end

        def create_date
          parse_datetime_with_timezone(options.fetch('createDate'))
        end

        def logon_count
          options.fetch('logonCount').to_i
        end

        def logon_minutes
          options.fetch('logonMinutes').to_i
        end
      end
    end
  end
end

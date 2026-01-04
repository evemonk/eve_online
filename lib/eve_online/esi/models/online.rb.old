# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Online < Base
        def as_json
          {
            last_login: last_login,
            last_logout: last_logout,
            logins: logins,
            online: online
          }
        end

        def last_login
          last_login = options["last_login"]

          parse_datetime_with_timezone(last_login) if last_login
        end

        def last_logout
          last_logout = options["last_logout"]

          parse_datetime_with_timezone(last_logout) if last_logout
        end

        def logins
          options["logins"]
        end

        def online
          options["online"]
        end
      end
    end
  end
end

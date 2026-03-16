# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Online < Object
        def as_json
          {
            last_login: attributes.last_login,
            last_logout: attributes.last_logout,
            logins: attributes.logins,
            online: attributes.online
          }
        end
      end
    end
  end
end

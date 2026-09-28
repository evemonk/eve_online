# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class KillmailReference < Object
        def as_json
          {
            killmail_hash: attributes.killmail_hash,
            killmail_id: attributes.killmail_id
          }
        end
      end
    end
  end
end

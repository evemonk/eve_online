# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class KillmailShort < Base
        def as_json
          {
            killmail_hash: killmail_hash,
            killmail_id: killmail_id
          }
        end

        def killmail_hash
          options["killmail_hash"]
        end

        def killmail_id
          options["killmail_id"]
        end
      end
    end
  end
end

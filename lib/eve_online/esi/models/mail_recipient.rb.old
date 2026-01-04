# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class MailRecipient < Base
        def as_json
          {
            recipient_id: recipient_id,
            recipient_type: recipient_type
          }
        end

        def recipient_id
          options["recipient_id"]
        end

        def recipient_type
          options["recipient_type"]
        end
      end
    end
  end
end

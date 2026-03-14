# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Notification < Object
        def as_json
          {
            is_read: attributes.is_read,
            notification_id: attributes.notification_id,
            sender_id: attributes.sender_id,
            sender_type: attributes.sender_type,
            text: attributes.text,
            timestamp: attributes.timestamp,
            type: attributes.type
          }
        end
      end
    end
  end
end

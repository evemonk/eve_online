# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Notification < Base
        def as_json
          {
            notification_id: notification_id,
            type: type,
            sender_id: sender_id,
            sender_type: sender_type,
            timestamp: timestamp,
            is_read: is_read,
            text: text
          }
        end

        def notification_id
          options['notification_id']
        end

        def type
          options['type']
        end

        def sender_id
          options['sender_id']
        end

        def sender_type
          options['sender_type']
        end

        def timestamp
          timestamp = options['timestamp']

          parse_datetime_with_timezone(timestamp) if timestamp
        end

        def is_read
          options['is_read']
        end

        def text
          options['text']
        end
      end
    end
  end
end

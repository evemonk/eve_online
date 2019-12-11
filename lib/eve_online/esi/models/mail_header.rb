# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class MailHeader < Base
        def as_json
          {
            from_id: from_id,
            is_read: is_read,
            mail_id: mail_id,
            subject: subject,
            timestamp: timestamp,
          }
        end

        def from_id
          options["from"]
        end

        def is_read
          options["is_read"]
        end

        def mail_id
          options["mail_id"]
        end

        def subject
          options["subject"]
        end

        def timestamp
          timestamp = options["timestamp"]

          parse_datetime_with_timezone(timestamp) if timestamp
        end

        def label_ids
          options["labels"]
        end

        def recipients
          @recipients ||= MailRecipients.new(options["recipients"]).mail_recipients
        end
      end
    end
  end
end

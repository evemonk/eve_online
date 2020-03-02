# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Mail < Base
        def as_json
          {
            body: body,
            from_id: from_id,
            read: read,
            subject: subject,
            timestamp: timestamp
          }
        end

        def body
          options["body"]
        end

        def from_id
          options["from"]
        end

        def read
          options["read"]
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

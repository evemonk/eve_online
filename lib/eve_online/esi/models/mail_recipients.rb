# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class MailRecipients < Base
        def mail_recipients
          output = []

          return output unless options.is_a?(Array)

          options.each do |mail_recipient|
            output << MailRecipient.new(mail_recipient)
          end

          output
        end
      end
    end
  end
end

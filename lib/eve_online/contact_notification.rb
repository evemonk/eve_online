module EveOnline
  class ContactNotification
    attr_reader :options

    def initialize(options)
      @options = options
    end

    def as_json
      {
        notification_id: notification_id,
        sender_id: sender_id,
        sender_name: sender_name,
        sent_date: sent_date,
        message_data: message_data
      }
    end

    def notification_id
      @notification_id ||= options.fetch('@notificationID').to_i
    end

    def sender_id
      @sender_id ||= options.fetch('@senderID').to_i
    end

    def sender_name
      @sender_name ||= options.fetch('@senderName')
    end

    def sent_date
      @sent_date ||= ActiveSupport::TimeZone['UTC'].parse(options.fetch('@sentDate'))
    end

    def message_data
      @message_data ||= options.fetch('@messageData')
    end
  end
end

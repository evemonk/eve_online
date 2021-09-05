# frozen_string_literal: true

module EveOnline
  module ESI
    class CharacterSendEmail < Base
      API_PATH = "/v1/characters/%<character_id>s/mail/"

      attr_reader :character_id, :subject, :body, :recipients, :approved_cost

      def initialize(options)
        super

        @character_id = options.fetch(:character_id)
        @subject = options.fetch(:subject)
        @body = options.fetch(:body)
        @recipients = options.fetch(:recipients)
        @approved_cost = options.fetch(:approved_cost, 0)
      end

      def http_method
        :post
      end

      def payload
        {
          approved_cost: approved_cost,
          body: body,
          recipients: recipients,
          subject: subject
        }.to_json
      end

      def scope
        "esi-mail.send_mail.v1"
      end

      def etag
        raise NotImplementedError
      end

      def path
        format(API_PATH, character_id: character_id)
      end
    end
  end
end

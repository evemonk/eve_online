# frozen_string_literal: true

module EveOnline
  module ESI
    class CharacterSendEmail < Base
      API_PATH = "/v1/characters/%<character_id>s/mail/"

      attr_reader :character_id

      def initialize(options)
        super

        @character_id = options.fetch(:character_id)
      end

      def send_email
        # TODO: implement
      end

      def http_method
        :post
      end

      def payload
        # TODO: implement
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
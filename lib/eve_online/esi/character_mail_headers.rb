# frozen_string_literal: true

module EveOnline
  module ESI
    class CharacterMailHeaders < Base
      API_PATH = "/v1/characters/%<character_id>s/mail/"

      attr_reader :character_id

      def initialize(options)
        super

        @character_id = options.fetch(:character_id)
        # TODO: labels
        # TODO: last_mail_id
      end

      def mail_headers
        @mail_headers ||=
          begin
            output = []
            response.each do |mail_header|
              output << Models::MailHeader.new(mail_header)
            end
            output
          end
      end

      def scope
        "esi-mail.read_mail.v1"
      end

      def path
        format(API_PATH, character_id: character_id)
      end
    end
  end
end

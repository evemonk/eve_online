# frozen_string_literal: true

module EveOnline
  module ESI
    class CharacterMailLabels < Base
      API_PATH = "/v3/characters/%<character_id>s/mail/labels/"

      attr_reader :character_id

      def initialize(options)
        super

        @character_id = options.fetch(:character_id)
      end

      def labels
        @labels ||=
          begin
            output = []
            response.fetch("labels").each do |label|
              output << Models::MailLabel.new(label)
            end
            output
          end
      end

      def total_unread_count
        response["total_unread_count"]
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

# frozen_string_literal: true

module EveOnline
  module ESI
    class CharacterNotifications < Base
      API_PATH = '/v5/characters/%<character_id>s/notifications/'

      attr_reader :character_id

      def initialize(options)
        super

        @character_id = options.fetch(:character_id)
      end

      def notifications
        @notifications ||=
          begin
            output = []
            response.each do |notification|
              output << Models::Notification.new(notification)
            end
            output
          end
      end

      def scope
        'esi-characters.read_notifications.v1'
      end

      def path
        format(API_PATH, character_id: character_id)
      end
    end
  end
end

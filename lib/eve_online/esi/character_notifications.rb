# frozen_string_literal: true

module EveOnline
  module ESI
    class CharacterNotifications < Base
      API_ENDPOINT = 'https://esi.tech.ccp.is/v1/characters/%<character_id>s/notifications/?datasource=tranquility'.freeze

      attr_reader :character_id

      def initialize(options)
        super

        @character_id = options[:character_id]
      end

      def notifications
        output = []
        response.each do |notification|
          output << Models::Notification.new(notification)
        end
        output
      end
      memoize :notifications

      def scope
        'esi-characters.read_notifications.v1'
      end

      def url
        format(API_ENDPOINT, character_id: character_id)
      end
    end
  end
end

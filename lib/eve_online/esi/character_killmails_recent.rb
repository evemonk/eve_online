# frozen_string_literal: true

module EveOnline
  module ESI
    class CharacterKillmailsRecent < Base
      API_PATH = "/v1/characters/%<character_id>s/killmails/recent/"

      attr_reader :character_id, :page

      def initialize(options = {})
        super

        @character_id = options.fetch(:character_id)
        @page = options.fetch(:page, 1)
      end

      def killmails
        @killmails ||=
          begin
            output = []
            response.each do |killmail|
              output << Models::KillmailShort.new(killmail)
            end
            output
          end
      end

      def scope
        "esi-killmails.read_killmails.v1"
      end

      def additional_query_params
        [:page]
      end

      def path
        format(API_PATH, character_id: character_id)
      end
    end
  end
end

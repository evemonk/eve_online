# frozen_string_literal: true

module EveOnline
  module ESI
    class WarKillmails < Base
      API_PATH = '/v1/wars/%<war_id>s/killmails/'

      attr_reader :war_id, :page

      def initialize(options = {})
        super

        @war_id = options.fetch(:war_id)
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

      def scope; end

      def additional_query_params
        [:page]
      end

      def path
        format(API_PATH, war_id: war_id)
      end
    end
  end
end

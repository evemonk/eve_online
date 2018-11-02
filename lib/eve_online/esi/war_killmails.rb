# frozen_string_literal: true

module EveOnline
  module ESI
    class WarKillmails < Base
      API_ENDPOINT = 'https://esi.evetech.net/v1/wars/%<war_id>s/killmails/?datasource=%<datasource>s&page=%<page>s'

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

      def url
        format(API_ENDPOINT, war_id: war_id, datasource: datasource, page: page)
      end
    end
  end
end

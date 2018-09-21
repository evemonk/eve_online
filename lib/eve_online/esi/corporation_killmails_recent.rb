# frozen_string_literal: true

module EveOnline
  module ESI
    class CorporationKillmailsRecent < Base
      API_ENDPOINT = 'https://esi.evetech.net/v1/corporations/%<corporation_id>s/killmails/recent/?datasource=%<datasource>s&page=%<page>s'

      attr_reader :corporation_id, :page

      def initialize(options = {})
        super

        @corporation_id = options.fetch(:corporation_id)
        @page = options.fetch(:page, 1)
      end

      def killmails
        output = []
        response.each do |killmail|
          output << Models::KillmailShort.new(killmail)
        end
        output
      end
      memoize :killmails

      def scope
        'esi-killmails.read_corporation_killmails.v1'
      end

      def url
        format(API_ENDPOINT, corporation_id: corporation_id, datasource: datasource, page: page)
      end
    end
  end
end

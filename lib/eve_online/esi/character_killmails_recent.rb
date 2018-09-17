# frozen_string_literal: true

module EveOnline
  module ESI
    class CharacterKillmailsRecent < Base
      API_ENDPOINT = 'https://esi.evetech.net/v1/characters/%<character_id>s/killmails/recent/?datasource=%<datasource>s&page=%<page>s'

      attr_reader :character_id, :page

      def initialize(options = {})
        super

        @character_id = options.fetch(:character_id)
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

      def total_pages
        resource.headers['x-pages']&.to_i
      end

      def scope
        'esi-killmails.read_killmails.v1'
      end

      def url
        format(API_ENDPOINT, character_id: character_id, datasource: datasource, page: page)
      end
    end
  end
end

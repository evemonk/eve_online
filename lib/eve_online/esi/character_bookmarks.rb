# frozen_string_literal: true

module EveOnline
  module ESI
    class CharacterBookmarks < Base
      API_ENDPOINT = 'https://esi.tech.ccp.is/v2/characters/%<character_id>s/bookmarks/?datasource=%<datasource>s'

      attr_reader :character_id

      def initialize(options)
        super

        @character_id = options[:character_id]
      end

      def bookmarks
        output = []
        response.each do |bookmark|
          output << Models::Bookmark.new(bookmark)
        end
        output
      end
      memoize :bookmarks

      def scope
        'esi-bookmarks.read_character_bookmarks.v1'
      end

      def url
        format(API_ENDPOINT, character_id: character_id, datasource: datasource)
      end
    end
  end
end

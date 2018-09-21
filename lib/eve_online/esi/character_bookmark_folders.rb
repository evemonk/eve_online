# frozen_string_literal: true

module EveOnline
  module ESI
    class CharacterBookmarkFolders < Base
      API_ENDPOINT = 'https://esi.evetech.net/v2/characters/%<character_id>s/bookmarks/folders/?datasource=%<datasource>s&page=%<page>s'

      attr_reader :character_id, :page

      def initialize(options)
        super

        @character_id = options.fetch(:character_id)
        @page = options.fetch(:page, 1)
      end

      def bookmark_folders
        output = []
        response.each do |bookmark_folder|
          output << Models::BookmarkFolder.new(bookmark_folder)
        end
        output
      end
      memoize :bookmark_folders

      def scope
        'esi-bookmarks.read_character_bookmarks.v1'
      end

      def url
        format(API_ENDPOINT, character_id: character_id, datasource: datasource, page: page)
      end
    end
  end
end

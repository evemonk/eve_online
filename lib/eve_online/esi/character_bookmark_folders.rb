# frozen_string_literal: true

module EveOnline
  module ESI
    class CharacterBookmarkFolders < Base
      API_PATH = '/v2/characters/%<character_id>s/bookmarks/folders/'

      attr_reader :character_id, :page

      def initialize(options)
        super

        @character_id = options.fetch(:character_id)
        @page = options.fetch(:page, 1)
      end

      def bookmark_folders
        @bookmark_folders ||=
          begin
            output = []
            response.each do |bookmark_folder|
              output << Models::BookmarkFolder.new(bookmark_folder)
            end
            output
          end
      end

      def scope
        'esi-bookmarks.read_character_bookmarks.v1'
      end

      def additation_query_params
        [:page]
      end

      def path
        format("#{ API_PATH }", character_id: character_id)
      end
    end
  end
end

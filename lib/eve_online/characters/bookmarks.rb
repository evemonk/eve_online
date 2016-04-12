module EveOnline
  module Characters
    # https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/character/char_bookmarks.html
    class Bookmarks < Base
      API_ENDPOINT = 'https://api.eveonline.com/char/Bookmarks.xml.aspx'.freeze

      attr_reader :key_id, :v_code, :character_id

      def initialize(key_id, v_code, character_id)
        super()
        @key_id = key_id
        @v_code = v_code
        @character_id = character_id
      end

      def bookmark_folders
        @bookmark_folders ||= begin
          case row
          when Hash
            [EveOnline::BookmarkFolder.new(row)]
          when Array
            bookmark_folders = []
            row.each do |bookmark_folder|
              bookmark_folders << EveOnline::BookmarkFolder.new(bookmark_folder)
            end
            bookmark_folders
          else
            raise ArgumentError
          end
        end
      end

      def row
        @row ||= rowset.fetch('row')
      end

      def rowset
        @rowset ||= result.fetch('rowset')
      end

      def url
        "#{ API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }&characterID=#{ character_id }"
      end
    end
  end
end

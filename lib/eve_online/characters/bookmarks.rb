module EveOnline
  module Characters
    # https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/character/char_bookmarks.html
    class Bookmarks < BaseXML
      API_ENDPOINT = 'https://api.eveonline.com/char/Bookmarks.xml.aspx'.freeze

      ACCESS_MASK = 268_435_456

      attr_reader :key_id, :v_code, :character_id

      def initialize(key_id, v_code, options = {})
        super()
        @key_id = key_id
        @v_code = v_code
        @character_id = options.fetch(:character_id, nil)
      end

      def bookmark_folders
        case row
        when Hash
          [BookmarkFolder.new(row)]
        when Array
          output = []
          row.each do |bookmark_folder|
            output << BookmarkFolder.new(bookmark_folder)
          end
          output
        else
          raise ArgumentError
        end
      end
      memoize :bookmark_folders

      def url
        output = "#{ API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }"
        output = "#{ output }&characterID=#{ character_id }" if character_id
        output
      end

      private

      def rowset
        result.fetch('rowset')
      end
      memoize :rowset

      def row
        rowset.fetch('row')
      end
      memoize :row
    end
  end
end

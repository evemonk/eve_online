require 'memoist'

module EveOnline
  class BookmarkFolder
    extend Memoist

    attr_reader :options

    def initialize(options)
      @options = options
    end

    def as_json
      {
        folder_id: folder_id,
        folder_name: folder_name
      }
    end

    def folder_id
      options.fetch('@folderID').to_i
    end

    def folder_name
      options.fetch('@folderName')
    end

    def bookmarks
      case row
      when Hash
        [Bookmark.new(row)]
      when Array
        bookmarks = []
        row.each do |bookmark|
          bookmarks << Bookmark.new(bookmark)
        end
        bookmarks
      else
        raise ArgumentError
      end
    end
    memoize :bookmarks

    private

    def rowset
      options.fetch('rowset')
    end
    memoize :rowset

    def row
      rowset.fetch('row')
    end
    memoize :row
  end
end

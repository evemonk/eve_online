module EveOnline
  class BookmarkFolder
    attr_reader :options

    def initialize(options = {})
      @options = options
    end

    def as_json
      {
        folder_id: folder_id,
        folder_name: folder_name
      }
    end

    # def as_json
    #   {
    #     folder_id: folder_id,
    #     folder_name: folder_name,
    #     bookmarks: bookmarks
    #   }
    # end

    def folder_id
      @folder_d ||= options.fetch('@folderID').to_i
    end

    def folder_name
      @folder_name ||= options.fetch('@folderName')
    end

    # def bookmarks
    #   { }
    # end
    #
    # def rowset
    #
    # end
  end
end

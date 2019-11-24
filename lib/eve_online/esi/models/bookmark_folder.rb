# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class BookmarkFolder < Base
        def as_json
          {
            folder_id: folder_id,
            name: name,
          }
        end

        def folder_id
          options["folder_id"]
        end

        def name
          options["name"]
        end
      end
    end
  end
end

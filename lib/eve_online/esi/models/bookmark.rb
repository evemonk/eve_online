module EveOnline
  module ESI
    module Models
      class Bookmark < Base
        def as_json
          {
            bookmark_id: bookmark_id,
            folder_id: folder_id,
            created: created,
            label: label,
            notes: notes,
            location_id: location_id,
            creator_id: creator_id
            # TODO: add 'item'
            # TODO: add 'coordinates'
          }
        end

        def bookmark_id
          options['bookmark_id']
        end

        def folder_id
          options['folder_id']
        end

        def created
          created = options['created']

          parse_datetime_with_timezone(created) if created
        end

        def label
          options['label']
        end

        def notes
          options['notes']
        end

        def location_id
          options['location_id']
        end

        def creator_id
          options['creator_id']
        end
      end
    end
  end
end

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
            creator_id: creator_id,
            item_id: item_id,
            item_type_id: item_type_id,
            coordinate_x: coordinate_x,
            coordinate_y: coordinate_y,
            coordinate_z: coordinate_z
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

        def item_id
          options['item']['item_id'] if options['item']
        end

        def item_type_id
          options['item']['type_id'] if options['item']
        end

        def coordinate_x
          options['coordinates']['x'] if options['coordinates']
        end

        def coordinate_y
          options['coordinates']['y'] if options['coordinates']
        end

        def coordinate_z
          options['coordinates']['z'] if options['coordinates']
        end
      end
    end
  end
end

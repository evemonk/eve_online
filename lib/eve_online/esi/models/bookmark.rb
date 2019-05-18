# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Bookmark < Base
        def as_json
          {
            bookmark_id: bookmark_id,
            created: created,
            creator_id: creator_id,
            folder_id: folder_id,
            item_id: item_id,
            item_type_id: item_type_id,
            label: label,
            location_id: location_id,
            notes: notes
          }
        end

        def bookmark_id
          options['bookmark_id']
        end

        def created
          created = options['created']

          parse_datetime_with_timezone(created) if created
        end

        def creator_id
          options['creator_id']
        end

        def folder_id
          options['folder_id']
        end

        # TODO: extract to class Item
        def item_id
          options['item']['item_id'] if options['item']
        end

        def item_type_id
          options['item']['type_id'] if options['item']
        end

        def label
          options['label']
        end

        def location_id
          options['location_id']
        end

        def notes
          options['notes']
        end

        def coordinates
          @coordinates ||= Coordinates.new(options['coordinates'])
        end

        # TODO: finish
        # def item
        #   @item ||= Item.new(options['item'])
        # end
      end
    end
  end
end

module EveOnline
  module ESI
    module Models
      class DogmaAttribute < Base
        def as_json
          {
            id: id,
            name: name,
            description: description,
            icon_id: icon_id,
            default_value: default_value,
            published: published,
            display_name: display_name,
            unit_id: unit_id,
            stackable: stackable,
            high_is_good: high_is_good
          }
        end

        def id
          options['attribute_id']
        end

        def name
          options['name']
        end

        def description
          options['description']
        end

        def icon_id
          options['icon_id']
        end

        def default_value
          options['default_value']
        end

        def published
          options['published']
        end

        def display_name
          options['display_name']
        end

        def unit_id
          options['unit_id']
        end

        def stackable
          options['stackable']
        end

        def high_is_good
          options['high_is_good']
        end
      end
    end
  end
end

# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class DogmaAttribute < Base
        def as_json
          {
            attribute_id: attribute_id,
            default_value: default_value,
            description: description,
            display_name: display_name,
            high_is_good: high_is_good,
            icon_id: icon_id,
            name: name,
            published: published,
            stackable: stackable,
            unit_id: unit_id
          }
        end

        def attribute_id
          options["attribute_id"]
        end

        def default_value
          options["default_value"]
        end

        def description
          options["description"]
        end

        def display_name
          options["display_name"]
        end

        def high_is_good
          options["high_is_good"]
        end

        def icon_id
          options["icon_id"]
        end

        def name
          options["name"]
        end

        def published
          options["published"]
        end

        def stackable
          options["stackable"]
        end

        def unit_id
          options["unit_id"]
        end
      end
    end
  end
end

# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Asset < Base
        def as_json
          {
            is_blueprint_copy: is_blueprint_copy,
            is_singleton: is_singleton,
            item_id: item_id,
            location_flag: location_flag,
            location_id: location_id,
            location_type: location_type,
            quantity: quantity,
            type_id: type_id
          }
        end

        def is_blueprint_copy
          options["is_blueprint_copy"]
        end

        def is_singleton
          options["is_singleton"]
        end

        def item_id
          options["item_id"]
        end

        def location_flag
          options["location_flag"]
        end

        def location_id
          options["location_id"]
        end

        def location_type
          options["location_type"]
        end

        def quantity
          options["quantity"]
        end

        def type_id
          options["type_id"]
        end
      end
    end
  end
end

module EveOnline
  module ESI
    module Models
      class Asset < Base
        def as_json
          {
            type_id: type_id,
            location_id: location_id,
            location_type: location_type,
            item_id: item_id,
            location_flag: location_flag,
            is_singleton: is_singleton,
            quantity: quantity
          }
        end

        def type_id
          options['type_id']
        end

        def location_id
          options['location_id']
        end

        def location_type
          options['location_type']
        end

        def item_id
          options['item_id']
        end

        def location_flag
          options['location_flag']
        end

        def is_singleton
          options['is_singleton']
        end

        def quantity
          options['quantity']
        end
      end
    end
  end
end

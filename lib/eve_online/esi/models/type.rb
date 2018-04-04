# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Type < Base
        def as_json
          {
            type_id: type_id,
            name: name,
            description: description,
            published: published,
            group_id: group_id,
            market_group_id: market_group_id,
            radius: radius,
            volume: volume,
            packaged_volume: packaged_volume,
            icon_id: icon_id,
            capacity: capacity,
            portion_size: portion_size,
            mass: mass,
            graphic_id: graphic_id
            # TODO: dogma_attributes
            # TODO: dogma_effects
          }
        end

        def type_id
          options['type_id']
        end

        def name
          options['name']
        end

        def description
          options['description']
        end

        def published
          options['published']
        end

        def group_id
          options['group_id']
        end

        def market_group_id
          options['market_group_id']
        end

        def radius
          options['radius']
        end

        def volume
          options['volume']
        end

        def packaged_volume
          options['packaged_volume']
        end

        def icon_id
          options['icon_id']
        end

        def capacity
          options['capacity']
        end

        def portion_size
          options['portion_size']
        end

        def mass
          options['mass']
        end

        def graphic_id
          options['graphic_id']
        end
      end
    end
  end
end

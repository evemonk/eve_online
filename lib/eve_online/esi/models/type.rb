# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Type < Object
        def as_json
          {
            capacity: attributes.capacity,
            description: attributes.description,
            graphic_id: attributes.graphic_id,
            group_id: attributes.group_id,
            icon_id: attributes.icon_id,
            market_group_id: attributes.market_group_id,
            mass: attributes.mass,
            name: attributes.name,
            packaged_volume: attributes.packaged_volume,
            portion_size: attributes.portion_size,
            published: attributes.published,
            radius: attributes.radius,
            type_id: attributes.type_id,
            volume: attributes.volume
          }
        end

        def dogma_attributes
          []
        end

        def dogma_effects
          []
        end
      end
    end
  end
end

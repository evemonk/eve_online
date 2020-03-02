# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Type < Base
        def as_json
          {
            capacity: capacity,
            description: description,
            graphic_id: graphic_id,
            group_id: group_id,
            icon_id: icon_id,
            market_group_id: market_group_id,
            mass: mass,
            name: name,
            packaged_volume: packaged_volume,
            portion_size: portion_size,
            published: published,
            radius: radius,
            type_id: type_id,
            volume: volume
          }
        end

        def capacity
          options["capacity"]
        end

        def description
          options["description"]
        end

        def graphic_id
          options["graphic_id"]
        end

        def group_id
          options["group_id"]
        end

        def icon_id
          options["icon_id"]
        end

        def market_group_id
          options["market_group_id"]
        end

        def mass
          options["mass"]
        end

        def name
          options["name"]
        end

        def packaged_volume
          options["packaged_volume"]
        end

        def portion_size
          options["portion_size"]
        end

        def published
          options["published"]
        end

        def radius
          options["radius"]
        end

        def type_id
          options["type_id"]
        end

        def volume
          options["volume"]
        end

        def dogma_attributes
          @dogma_attributes ||= DogmaAttributes.new(options["dogma_attributes"]).dogma_attributes
        end

        def dogma_effects
          @dogma_effects ||= DogmaEffects.new(options["dogma_effects"]).dogma_effects
        end
      end
    end
  end
end

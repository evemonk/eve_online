# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class DogmaEffect < Object
        def as_json
          {
            description: attributes.description,
            disallow_auto_repeat: attributes.disallow_auto_repeat,
            discharge_attribute_id: attributes.discharge_attribute_id,
            display_name: attributes.display_name,
            duration_attribute_id: attributes.duration_attribute_id,
            effect_category: attributes.effect_category,
            effect_id: attributes.effect_id,
            electronic_chance: attributes.electronic_chance,
            falloff_attribute_id: attributes.falloff_attribute_id,
            icon_id: attributes.icon_id,
            is_assistance: attributes.is_assistance,
            is_offensive: attributes.is_offensive,
            is_warp_safe: attributes.is_warp_safe,
            name: attributes.name,
            post_expression: attributes.post_expression,
            pre_expression: attributes.pre_expression,
            published: attributes.published,
            range_attribute_id: attributes.range_attribute_id,
            range_chance: attributes.range_chance,
            tracking_speed_attribute_id: tracking_speed_attribute_id
          }
        end
      end
    end
  end
end

# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class DogmaEffect < Base
        def as_json
          {
            description: description,
            disallow_auto_repeat: disallow_auto_repeat,
            discharge_attribute_id: discharge_attribute_id,
            display_name: display_name,
            duration_attribute_id: duration_attribute_id,
            effect_category: effect_category,
            effect_id: effect_id,
            electronic_chance: electronic_chance,
            falloff_attribute_id: falloff_attribute_id,
            icon_id: icon_id,
            is_assistance: is_assistance,
            is_offensive: is_offensive,
            is_warp_safe: is_warp_safe,
            name: name,
            post_expression: post_expression,
            pre_expression: pre_expression,
            published: published,
            range_attribute_id: range_attribute_id,
            range_chance: range_chance,
            tracking_speed_attribute_id: tracking_speed_attribute_id
          }
        end

        def description
          options["description"]
        end

        def disallow_auto_repeat
          options["disallow_auto_repeat"]
        end

        def discharge_attribute_id
          options["discharge_attribute_id"]
        end

        def display_name
          options["display_name"]
        end

        def duration_attribute_id
          options["duration_attribute_id"]
        end

        def effect_category
          options["effect_category"]
        end

        def effect_id
          options["effect_id"]
        end

        def electronic_chance
          options["electronic_chance"]
        end

        def falloff_attribute_id
          options["falloff_attribute_id"]
        end

        def icon_id
          options["icon_id"]
        end

        def is_assistance
          options["is_assistance"]
        end

        def is_offensive
          options["is_offensive"]
        end

        def is_warp_safe
          options["is_warp_safe"]
        end

        def name
          options["name"]
        end

        def post_expression
          options["post_expression"]
        end

        def pre_expression
          options["pre_expression"]
        end

        def published
          options["published"]
        end

        def range_attribute_id
          options["range_attribute_id"]
        end

        def range_chance
          options["range_chance"]
        end

        def tracking_speed_attribute_id
          options["tracking_speed_attribute_id"]
        end

        def modifiers
          @modifiers ||= DogmaEffectModifiers.new(options["modifiers"]).modifiers
        end
      end
    end
  end
end

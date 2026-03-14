# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class DogmaEffectModifier < Object
        def as_json
          {
            domain: attributes.domain,
            effect_id: attributes.effect_id,
            func: attributes.func,
            modified_attribute_id: attributes.modified_attribute_id,
            modifying_attribute_id: attributes.modifying_attribute_id,
            operator: attributes.operator
          }
        end
      end
    end
  end
end

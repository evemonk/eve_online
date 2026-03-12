# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class DogmaEffectShort < Object
        def as_json
          {
            effect_id: attributes.effect_id,
            is_default: attributes.is_default
          }
        end
      end
    end
  end
end

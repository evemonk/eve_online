# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class DogmaEffectShort < Base
        def as_json
          {
            effect_id: effect_id,
            is_default: is_default
          }
        end

        def effect_id
          options["effect_id"]
        end

        def is_default
          options["is_default"]
        end
      end
    end
  end
end

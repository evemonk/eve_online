# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class CosmeticSkinrLayout < Object
        def as_json
          {
            pattern_blend_mode: attributes.pattern_blend_mode
          }
        end

        def slots
          Collection.from_array(attributes.slots || [], type: CosmeticSkinrLayoutSlot)
        end
      end
    end
  end
end

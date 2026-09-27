# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class DogmaDynamicItem < Object
        def as_json
          {
            created_by: attributes.created_by,
            mutator_type_id: attributes.mutator_type_id,
            source_type_id: attributes.source_type_id
          }
        end

        def dogma_attributes
          Collection.from_array(attributes.dogma_attributes || [], type: DogmaAttributeModifier)
        end

        def dogma_effects
          Collection.from_array(attributes.dogma_effects || [], type: DogmaDynamicEffect)
        end
      end
    end
  end
end

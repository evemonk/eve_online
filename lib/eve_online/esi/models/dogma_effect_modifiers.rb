# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class DogmaEffectModifiers < Base
        def modifiers
          output = []

          return output unless options.is_a?(Array)

          options.each do |dogma_effect_modifier|
            output << DogmaEffectModifier.new(dogma_effect_modifier)
          end

          output
        end
      end
    end
  end
end

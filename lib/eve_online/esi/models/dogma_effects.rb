# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class DogmaEffects < Base
        def dogma_effects
          output = []

          return output unless options.is_a?(Array)

          options.each do |dogma_effect_short|
            output << DogmaEffectShort.new(dogma_effect_short)
          end

          output
        end
      end
    end
  end
end

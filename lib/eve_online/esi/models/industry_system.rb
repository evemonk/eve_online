# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class IndustrySystem < Object
        def as_json
          {
            solar_system_id: attributes.solar_system_id
          }
        end

        def cost_indices
          Collection.from_array(attributes.cost_indices || [], type: IndustryCostIndex)
        end
      end
    end
  end
end

# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class SovereigntySystems < Object
        def solar_systems
          Collection.from_array(attributes.solar_systems || [], type: SovereigntySystem)
        end
      end
    end
  end
end

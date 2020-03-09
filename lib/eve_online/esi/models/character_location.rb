# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class CharacterLocation < Base
        def as_json
          {
            solar_system_id: solar_system_id,
            station_id: station_id,
            structure_id: structure_id
          }
        end

        def solar_system_id
          options["solar_system_id"]
        end

        def station_id
          options["station_id"]
        end

        def structure_id
          options["structure_id"]
        end
      end
    end
  end
end

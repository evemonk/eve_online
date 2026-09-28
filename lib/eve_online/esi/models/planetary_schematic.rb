# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class PlanetarySchematic < Object
        def as_json
          {
            cycle_time: attributes.cycle_time,
            schematic_name: attributes.schematic_name
          }
        end
      end
    end
  end
end

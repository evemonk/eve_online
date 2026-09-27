# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class FactionWarfareSystem < Object
        def as_json
          {
            contested: attributes.contested,
            occupier_faction_id: attributes.occupier_faction_id,
            owner_faction_id: attributes.owner_faction_id,
            solar_system_id: attributes.solar_system_id,
            victory_points: attributes.victory_points,
            victory_points_threshold: attributes.victory_points_threshold
          }
        end
      end
    end
  end
end

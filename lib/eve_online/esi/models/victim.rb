# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Victim < Object
        def as_json
          {
            alliance_id: attributes.alliance_id,
            character_id: attributes.character_id,
            corporation_id: attributes.corporation_id,
            damage_taken: attributes.damage_taken,
            faction_id: attributes.faction_id,
            ship_type_id: attributes.ship_type_id
          }
        end

        def items

        end

        def position

        end
      end
    end
  end
end

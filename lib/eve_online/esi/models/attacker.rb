# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Attacker < Object
        def as_json
          {
            alliance_id: attributes.alliance_id,
            character_id: attributes.character_id,
            corporation_id: attributes.corporation_id,
            damage_done: attributes.damage_done,
            faction_id: attributes.faction_id,
            final_blow: attributes.final_blow,
            security_status: attributes.security_status,
            ship_type_id: attributes.ship_type_id,
            weapon_type_id: attributes.weapon_type_id
          }
        end
      end
    end
  end
end

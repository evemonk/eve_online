# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class CharacterAffiliation < Object
        def as_json
          {
            alliance_id: attributes.alliance_id,
            character_id: attributes.character_id,
            corporation_id: attributes.corporation_id,
            faction_id: attributes.faction_id
          }
        end
      end
    end
  end
end

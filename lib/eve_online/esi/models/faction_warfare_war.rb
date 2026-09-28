# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class FactionWarfareWar < Object
        def as_json
          {
            against_id: attributes.against_id,
            faction_id: attributes.faction_id
          }
        end
      end
    end
  end
end

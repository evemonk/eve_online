# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Aggressor < Object
        def as_json
          {
            alliance_id: attributes.alliance_id,
            corporation_id: attributes.corporation_id,
            isk_destroyed: attributes.isk_destroyed,
            ships_killed: attributes.ships_killed
          }
        end
      end
    end
  end
end

# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Race < Object
        def as_json
          {
            faction_id: faction_id,
            description: attributes.description,
            name: attributes.name,
            id: id
          }
        end

        def id
          attributes.race_id
        end

        def faction_id
          attributes.alliance_id
        end
      end
    end
  end
end

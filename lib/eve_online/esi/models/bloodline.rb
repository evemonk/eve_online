# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Bloodline < Object
        def as_json
          {
            id: id,
            charisma: attributes.charisma,
            corporation_id: attributes.corporation_id,
            description: attributes.description,
            intelligence: attributes.intelligence,
            memory: attributes.memory,
            name: attributes.name,
            perception: attributes.perception,
            race_id: attributes.race_id,
            ship_type_id: attributes.ship_type_id,
            willpower: attributes.willpower
          }
        end

        def id
          attributes.bloodline_id
        end
      end
    end
  end
end

# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Bloodline < Base
        def as_json
          {
            bloodline_id: bloodline_id,
            charisma: charisma,
            corporation_id: corporation_id,
            description: description,
            intelligence: intelligence,
            memory: memory,
            name: name,
            perception: perception,
            race_id: race_id,
            ship_type_id: ship_type_id,
            willpower: willpower
          }
        end

        def bloodline_id
          options["bloodline_id"]
        end

        def charisma
          options["charisma"]
        end

        def corporation_id
          options["corporation_id"]
        end

        def description
          options["description"]
        end

        def intelligence
          options["intelligence"]
        end

        def memory
          options["memory"]
        end

        def name
          options["name"]
        end

        def perception
          options["perception"]
        end

        def race_id
          options["race_id"]
        end

        def ship_type_id
          options["ship_type_id"]
        end

        def willpower
          options["willpower"]
        end
      end
    end
  end
end

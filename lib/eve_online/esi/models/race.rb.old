# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Race < Base
        def as_json
          {
            faction_id: faction_id,
            description: description,
            name: name,
            race_id: race_id
          }
        end

        def faction_id
          options["alliance_id"]
        end

        def description
          options["description"]
        end

        def name
          options["name"]
        end

        def race_id
          options["race_id"]
        end
      end
    end
  end
end

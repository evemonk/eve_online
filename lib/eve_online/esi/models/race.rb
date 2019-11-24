# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Race < Base
        def as_json
          {
            alliance_id: alliance_id,
            description: description,
            name: name,
            race_id: race_id,
          }
        end

        def alliance_id
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

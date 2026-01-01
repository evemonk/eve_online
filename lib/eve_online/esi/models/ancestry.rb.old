# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Ancestry < Base
        def as_json
          {
            bloodline_id: bloodline_id,
            description: description,
            icon_id: icon_id,
            ancestry_id: ancestry_id,
            name: name,
            short_description: short_description
          }
        end

        def bloodline_id
          options["bloodline_id"]
        end

        def description
          options["description"]
        end

        def icon_id
          options["icon_id"]
        end

        def ancestry_id
          options["id"]
        end

        def name
          options["name"]
        end

        def short_description
          options["short_description"]
        end
      end
    end
  end
end

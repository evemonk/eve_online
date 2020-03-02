# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Region < Base
        def as_json
          {
            description: description,
            name: name,
            region_id: region_id
          }
        end

        def description
          options["description"]
        end

        def name
          options["name"]
        end

        def region_id
          options["region_id"]
        end

        def constellation_ids
          options["constellations"]
        end
      end
    end
  end
end

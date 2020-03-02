# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Planet < Base
        def as_json
          {
            name: name,
            planet_id: planet_id,
            system_id: system_id,
            type_id: type_id
          }
        end

        def name
          options["name"]
        end

        def planet_id
          options["planet_id"]
        end

        def system_id
          options["system_id"]
        end

        def type_id
          options["type_id"]
        end

        def position
          @position ||= Position.new(options["position"])
        end
      end
    end
  end
end

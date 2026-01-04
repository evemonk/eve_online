# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Moon < Base
        def as_json
          {
            moon_id: moon_id,
            name: name,
            system_id: system_id
          }
        end

        def moon_id
          options["moon_id"]
        end

        def name
          options["name"]
        end

        def system_id
          options["system_id"]
        end

        def position
          @position ||= Position.new(options["position"])
        end
      end
    end
  end
end

# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class AsteroidBelt < Base
        def as_json
          {
            name: name,
            system_id: system_id
          }
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

# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class SystemJump < Base
        def as_json
          {
            ship_jumps: ship_jumps,
            system_id: system_id
          }
        end

        def ship_jumps
          options["ship_jumps"]
        end

        def system_id
          options["system_id"]
        end
      end
    end
  end
end

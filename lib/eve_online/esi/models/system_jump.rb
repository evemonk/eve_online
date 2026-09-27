# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class SystemJump < Object
        def as_json
          {
            ship_jumps: attributes.ship_jumps,
            system_id: attributes.system_id
          }
        end
      end
    end
  end
end

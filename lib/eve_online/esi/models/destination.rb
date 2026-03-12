# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Destination < Object
        def as_json
          {
            stargate_id: attributes.stargate_id,
            system_id: attributes.system_id
          }
        end
      end
    end
  end
end

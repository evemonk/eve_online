# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class SovereigntySystem < Object
        def as_json
          {
            claim: attributes.claim,
            solar_system_id: attributes.solar_system_id
          }
        end
      end
    end
  end
end

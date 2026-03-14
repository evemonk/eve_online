# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class LoyaltyPoint < Object
        def as_json
          {
            corporation_id: attributes.corporation_id,
            loyalty_points: attributes.loyalty_points
          }
        end
      end
    end
  end
end

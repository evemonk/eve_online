# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class LoyaltyPoint < Base
        def as_json
          {
            corporation_id: corporation_id,
            loyalty_points: loyalty_points
          }
        end

        def corporation_id
          options["corporation_id"]
        end

        def loyalty_points
          options["loyalty_points"]
        end
      end
    end
  end
end

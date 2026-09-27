# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class InsurancePriceLevel < Object
        def as_json
          {
            cost: attributes.cost,
            name: attributes.name,
            payout: attributes.payout
          }
        end
      end
    end
  end
end

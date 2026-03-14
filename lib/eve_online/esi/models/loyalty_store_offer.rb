# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class LoyaltyStoreOffer < Object
        def as_json
          {
            ak_cost: attributes.ak_cost,
            isk_cost: attributes.isk_cost,
            lp_cost: attributes.lp_cost,
            offer_id: attributes.offer_id,
            quantity: attributes.quantity,
            type_id: attributes.type_id
          }
        end

        def required_items

        end
      end
    end
  end
end

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

        def offer_required_items
          @offer_required_items ||= Collection.from_array(attributes.required_items || [], type: OfferRequiredItem)
        end
      end
    end
  end
end

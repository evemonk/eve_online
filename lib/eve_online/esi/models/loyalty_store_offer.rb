# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class LoyaltyStoreOffer < Base
        def as_json
          {
            ak_cost: ak_cost,
            isk_cost: isk_cost,
            lp_cost: lp_cost,
            offer_id: offer_id,
            quantity: quantity,
            type_id: type_id
          }
        end

        def ak_cost
          options["ak_cost"]
        end

        def isk_cost
          options["isk_cost"]
        end

        def lp_cost
          options["lp_cost"]
        end

        def offer_id
          options["offer_id"]
        end

        def quantity
          options["quantity"]
        end

        def type_id
          options["type_id"]
        end

        def offer_required_items
          @offer_required_items ||= OfferRequiredItems.new(options["required_items"]).offer_required_items
        end
      end
    end
  end
end

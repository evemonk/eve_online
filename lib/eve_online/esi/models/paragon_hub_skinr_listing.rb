# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class ParagonHubSkinrListing < Object
        def as_json
          {
            created: attributes.created,
            expires: attributes.expires,
            id: attributes.id,
            last_modified: attributes.last_modified,
            price: attributes.price,
            quantity: attributes.quantity,
            seller_id: attributes.seller_id,
            skinr_id: attributes.skinr_id,
            state: attributes.state
          }
        end
      end
    end
  end
end

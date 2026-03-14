# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class OfferRequiredItem < Object
        def as_json
          {
            quantity: attributes.quantity,
            type_id: attributes.type_id
          }
        end
      end
    end
  end
end

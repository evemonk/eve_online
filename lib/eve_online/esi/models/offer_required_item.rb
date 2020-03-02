# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class OfferRequiredItem < Base
        def as_json
          {
            quantity: quantity,
            type_id: type_id
          }
        end

        def quantity
          options["quantity"]
        end

        def type_id
          options["type_id"]
        end
      end
    end
  end
end

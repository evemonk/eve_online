# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class MarketPrice < Object
        def as_json
          {
            adjusted_price: attributes.adjusted_price,
            average_price: attributes.average_price,
            type_id: attributes.type_id
          }
        end
      end
    end
  end
end

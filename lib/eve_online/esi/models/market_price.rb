# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class MarketPrice < Base
        def as_json
          {
            adjusted_price: adjusted_price,
            average_price: average_price,
            id: id
          }
        end

        def adjusted_price
          options["adjusted_price"]
        end

        def average_price
          options["average_price"]
        end

        def id
          options["type_id"]
        end
      end
    end
  end
end

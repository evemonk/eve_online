# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class MarketHistory < Object
        def as_json
          {
            average: attributes.average,
            date: attributes.date,
            highest: attributes.highest,
            lowest: attributes.lowest,
            order_count: attributes.order_count,
            volume: attributes.volume
          }
        end
      end
    end
  end
end

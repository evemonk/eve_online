# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class MarketOrder < Object
        def as_json
          {
            duration: attributes.duration,
            is_buy_order: attributes.is_buy_order,
            issued: attributes.issued,
            location_id: attributes.location_id,
            min_volume: attributes.min_volume,
            order_id: attributes.order_id,
            price: attributes.price,
            range: attributes.range,
            system_id: attributes.system_id,
            type_id: attributes.type_id,
            volume_remain: attributes.volume_remain,
            volume_total: attributes.volume_total
          }
        end
      end
    end
  end
end

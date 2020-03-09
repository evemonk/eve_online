# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class CorporationOrder < Base
        def as_json
          {
            duration: duration,
            escrow: escrow,
            is_buy_order: is_buy_order,
            issued: issued,
            issued_by: issued_by,
            location_id: location_id,
            min_volume: min_volume,
            order_id: order_id,
            price: price,
            range: range,
            region_id: region_id,
            type_id: type_id,
            volume_remain: volume_remain,
            volume_total: volume_total,
            wallet_division: wallet_division
          }
        end

        def duration
          options["duration"]
        end

        def escrow
          options["escrow"]
        end

        def is_buy_order
          options["is_buy_order"]
        end

        def issued
          issued = options["issued"]

          parse_datetime_with_timezone(issued) if issued
        end

        def issued_by
          options["issued_by"]
        end

        def location_id
          options["location_id"]
        end

        def min_volume
          options["min_volume"]
        end

        def order_id
          options["order_id"]
        end

        def price
          options["price"]
        end

        def range
          options["range"]
        end

        def region_id
          options["region_id"]
        end

        def type_id
          options["type_id"]
        end

        def volume_remain
          options["volume_remain"]
        end

        def volume_total
          options["volume_total"]
        end

        def wallet_division
          options["wallet_division"]
        end
      end
    end
  end
end

module EveOnline
  module ESI
    module Models
      class CharacterOrder < Base
        def as_json
          {
            order_id: order_id,
            type_id: type_id,
            region_id: region_id,
            location_id: location_id,
            range: range,
            is_buy_order: is_buy_order,
            price: price,
            volume_total: volume_total,
            volume_remain: volume_remain,
            issued: issued,
            state: state,
            min_volume: min_volume,
            account_id: account_id,
            duration: duration,
            is_corp: is_corp,
            escrow: escrow
          }
        end

        def order_id
          options['order_id']
        end

        def type_id
          options['type_id']
        end

        def region_id
          options['region_id']
        end

        def location_id
          options['location_id']
        end

        def range
          options['range']
        end

        def is_buy_order
          options['is_buy_order']
        end

        def price
          options['price']
        end

        def volume_total
          options['volume_total']
        end

        def volume_remain
          options['volume_remain']
        end

        def issued
          issued = options['issued']

          parse_datetime_with_timezone(issued) if issued
        end

        def state
          options['state']
        end

        def min_volume
          options['min_volume']
        end

        def account_id
          options['account_id']
        end

        def duration
          options['duration']
        end

        def is_corp
          options['is_corp']
        end

        def escrow
          options['escrow']
        end
      end
    end
  end
end

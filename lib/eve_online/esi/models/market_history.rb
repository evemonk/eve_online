# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class MarketHistory < Base
        def as_json
          {
            date: date,
            order_count: order_count,
            volume: volume,
            highest: highest,
            average: average,
            lowest: lowest
          }
        end

        def date
          date = options['date']

          parse_datetime_with_timezone(date) if date
        end

        def order_count
          options['order_count']
        end

        def volume
          options['volume']
        end

        def highest
          options['highest']
        end

        def average
          options['average']
        end

        def lowest
          options['lowest']
        end
      end
    end
  end
end

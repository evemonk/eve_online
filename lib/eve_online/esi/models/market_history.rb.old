# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class MarketHistory < Base
        def as_json
          {
            average: average,
            date: date,
            highest: highest,
            lowest: lowest,
            order_count: order_count,
            volume: volume
          }
        end

        def average
          options["average"]
        end

        def date
          date = options["date"]

          parse_datetime_with_timezone(date) if date
        end

        def highest
          options["highest"]
        end

        def lowest
          options["lowest"]
        end

        def order_count
          options["order_count"]
        end

        def volume
          options["volume"]
        end
      end
    end
  end
end

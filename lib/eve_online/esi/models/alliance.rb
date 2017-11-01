module EveOnline
  module ESI
    module Models
      class Alliance < Base
        def as_json
          {
            alliance_name: alliance_name,
            ticker: ticker,
            date_founded: date_founded,
            executor_corp: executor_corp
          }
        end

        def alliance_name
          options['alliance_name']
        end

        def ticker
          options['ticker']
        end

        def date_founded
          date_founded = options['date_founded']

          parse_datetime_with_timezone(date_founded) if date_founded
        end

        def executor_corp
          options['executor_corp']
        end
      end
    end
  end
end

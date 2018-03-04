# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Alliance < Base
        def as_json
          {
            name: name,
            ticker: ticker,
            creator_id: creator_id,
            creator_corporation_id: creator_corporation_id,
            executor_corporation_id: executor_corporation_id,
            date_founded: date_founded,
            faction_id: faction_id
          }
        end

        def name
          options['name']
        end

        def ticker
          options['ticker']
        end

        def creator_id
          options['creator_id']
        end

        def creator_corporation_id
          options['creator_corporation_id']
        end

        def executor_corporation_id
          options['executor_corporation_id']
        end

        def date_founded
          date_founded = options['date_founded']

          parse_datetime_with_timezone(date_founded) if date_founded
        end

        def faction_id
          options['faction_id']
        end
      end
    end
  end
end

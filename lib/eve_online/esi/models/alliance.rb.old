# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Alliance < Base
        def as_json
          {
            creator_corporation_id: creator_corporation_id,
            creator_id: creator_id,
            date_founded: date_founded,
            executor_corporation_id: executor_corporation_id,
            faction_id: faction_id,
            name: name,
            ticker: ticker
          }
        end

        def creator_corporation_id
          options["creator_corporation_id"]
        end

        def creator_id
          options["creator_id"]
        end

        def date_founded
          date_founded = options["date_founded"]

          parse_datetime_with_timezone(date_founded) if date_founded
        end

        def executor_corporation_id
          options["executor_corporation_id"]
        end

        def faction_id
          options["faction_id"]
        end

        def name
          options["name"]
        end

        def ticker
          options["ticker"]
        end
      end
    end
  end
end

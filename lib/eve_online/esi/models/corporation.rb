# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Corporation < Base
        def as_json
          {
            alliance_id: alliance_id,
            ceo_id: ceo_id,
            creator_id: creator_id,
            date_founded: date_founded,
            description: description,
            faction_id: faction_id,
            home_station_id: home_station_id,
            member_count: member_count,
            name: name,
            shares: shares,
            tax_rate: tax_rate,
            ticker: ticker,
            corporation_url: corporation_url,
            war_eligible: war_eligible,
          }
        end

        def alliance_id
          options["alliance_id"]
        end

        def ceo_id
          options["ceo_id"]
        end

        def creator_id
          options["creator_id"]
        end

        def date_founded
          date_founded = options["date_founded"]

          parse_datetime_with_timezone(date_founded) if date_founded
        end

        def description
          options["description"]
        end

        def faction_id
          options["faction_id"]
        end

        def home_station_id
          options["home_station_id"]
        end

        def member_count
          options["member_count"]
        end

        def name
          options["name"]
        end

        def shares
          options["shares"]
        end

        def tax_rate
          options["tax_rate"]
        end

        def ticker
          options["ticker"]
        end

        def corporation_url
          options["url"]
        end

        def war_eligible
          options["war_eligible"]
        end
      end
    end
  end
end

# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Corporation < Base
        def as_json
          {
            name: name,
            ticker: ticker,
            member_count: member_count,
            ceo_id: ceo_id,
            alliance_id: alliance_id,
            description: description,
            tax_rate: tax_rate,
            date_founded: date_founded,
            creator_id: creator_id,
            corporation_url: corporation_url,
            faction_id: faction_id,
            home_station_id: home_station_id,
            shares: shares
          }
        end

        def name
          options['name']
        end

        def ticker
          options['ticker']
        end

        def member_count
          options['member_count']
        end

        def ceo_id
          options['ceo_id']
        end

        def alliance_id
          options['alliance_id']
        end

        def description
          options['description']
        end

        def tax_rate
          options['tax_rate']
        end

        def date_founded
          date_founded = options['date_founded']

          parse_datetime_with_timezone(date_founded) if date_founded
        end

        def creator_id
          options['creator_id']
        end

        def corporation_url
          options['url']
        end

        def home_station_id
          options['home_station_id']
        end

        def faction_id
          options['faction_id']
        end

        def shares
          options['shares']
        end
      end
    end
  end
end

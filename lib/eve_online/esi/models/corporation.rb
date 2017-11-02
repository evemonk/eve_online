module EveOnline
  module ESI
    module Models
      class Corporation < Base
        def as_json
          {
            alliance_id: alliance_id,
            ceo_id: ceo_id,
            corporation_description: corporation_description,
            corporation_name: corporation_name,
            creation_date: creation_date,
            creator_id: creator_id,
            faction: faction,
            member_count: member_count,
            tax_rate: tax_rate,
            ticker: ticker,
            corporation_url: corporation_url
          }
        end

        def alliance_id
          options['alliance_id']
        end

        def ceo_id
          birthday = options['ceo_id']
        end

        def corporation_description
          options['corporation_description']
        end

        def corporation_name
          options['corporation_name']
        end

        def creation_date
          creation_date = options['creation_date']

          parse_datetime_with_timezone(creation_date) if creation_date
        end

        def creator_id
          options['creator_id']
        end

        def faction
          options['faction']
        end

        def member_count
          options['member_count']
        end

        def tax_rate
          options['tax_rate']
        end

        def ticker
          options['ticker']
        end

        def corporation_url
          options['url']
        end
      end
    end
  end
end

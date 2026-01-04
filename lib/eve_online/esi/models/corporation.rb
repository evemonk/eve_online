# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Corporation < Object
        def as_json
          {
            alliance_id: attributes.alliance_id,
            ceo_id: attributes.ceo_id,
            creator_id: attributes.creator_id,
            date_founded: attributes.date_founded,
            description: attributes.description,
            faction_id: attributes.faction_id,
            home_station_id: attributes.home_station_id,
            member_count: attributes.member_count,
            name: attributes.name,
            shares: attributes.shares,
            tax_rate: attributes.tax_rate,
            ticker: attributes.ticker,
            corporation_url: corporation_url,
            war_eligible: attributes.war_eligible
          }
        end

        def corporation_url
          attributes.url
        end
      end
    end
  end
end

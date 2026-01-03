# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Alliance < Object
        def as_json
          {
            creator_corporation_id: attributes.creator_corporation_id,
            creator_id: attributes.creator_id,
            date_founded: attributes.date_founded,
            executor_corporation_id: attributes.executor_corporation_id,
            faction_id: attributes.faction_id,
            name: attributes.name,
            ticker: attributes.ticker
          }
        end
      end
    end
  end
end

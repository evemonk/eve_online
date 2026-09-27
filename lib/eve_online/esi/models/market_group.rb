# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class MarketGroup < Object
        def as_json
          {
            description: attributes.description,
            market_group_id: attributes.market_group_id,
            name: attributes.name,
            parent_group_id: attributes.parent_group_id,
            types: attributes.types
          }
        end
      end
    end
  end
end

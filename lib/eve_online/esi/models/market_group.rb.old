# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class MarketGroup < Base
        def as_json
          {
            description: description,
            market_group_id: market_group_id,
            name: name,
            parent_group_id: parent_group_id
          }
        end

        def description
          options["description"]
        end

        def market_group_id
          options["market_group_id"]
        end

        def name
          options["name"]
        end

        def parent_group_id
          options["parent_group_id"]
        end

        def type_ids
          options["types"]
        end
      end
    end
  end
end

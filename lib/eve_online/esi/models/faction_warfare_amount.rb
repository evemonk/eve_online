# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class FactionWarfareAmount < Object
        def as_json
          {
            amount: attributes.amount,
            faction_id: attributes.faction_id
          }
        end
      end
    end
  end
end

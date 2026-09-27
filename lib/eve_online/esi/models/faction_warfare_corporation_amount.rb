# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class FactionWarfareCorporationAmount < Object
        def as_json
          {
            amount: attributes.amount,
            corporation_id: attributes.corporation_id
          }
        end
      end
    end
  end
end

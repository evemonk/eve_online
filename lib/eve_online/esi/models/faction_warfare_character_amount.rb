# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class FactionWarfareCharacterAmount < Object
        def as_json
          {
            amount: attributes.amount,
            character_id: attributes.character_id
          }
        end
      end
    end
  end
end

# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class InsurancePrice < Object
        def as_json
          {
            type_id: attributes.type_id
          }
        end

        def levels
          Collection.from_array(attributes.levels || [], type: InsurancePriceLevel)
        end
      end
    end
  end
end

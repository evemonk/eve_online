# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class FreelanceJobRestrictions < Object
        def as_json
          {
            maximum_age: attributes.maximum_age,
            minimum_age: attributes.minimum_age
          }
        end
      end
    end
  end
end

# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class FreelanceJobReward < Object
        def as_json
          {
            initial: attributes.initial,
            remaining: attributes.remaining
          }
        end
      end
    end
  end
end

# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class FreelanceJobProgress < Object
        def as_json
          {
            current: attributes.current,
            desired: attributes.desired
          }
        end
      end
    end
  end
end

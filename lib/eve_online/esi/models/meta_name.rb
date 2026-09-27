# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class MetaName < Object
        def as_json
          {
            current: attributes.current,
            history: attributes.history
          }
        end
      end
    end
  end
end

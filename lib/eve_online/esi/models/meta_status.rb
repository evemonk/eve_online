# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class MetaStatus < Object
        def as_json
          {
            routes: attributes.routes
          }
        end
      end
    end
  end
end

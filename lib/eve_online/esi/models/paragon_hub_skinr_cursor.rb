# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class ParagonHubSkinrCursor < Object
        def as_json
          {
            after: attributes.after,
            before: attributes.before
          }
        end
      end
    end
  end
end

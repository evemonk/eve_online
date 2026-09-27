# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class CosmeticSkinrTier < Object
        def as_json
          {
            level: attributes.level
          }
        end
      end
    end
  end
end

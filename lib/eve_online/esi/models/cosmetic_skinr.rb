# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class CosmeticSkinr < Object
        def as_json
          {
            creator_id: attributes.creator_id,
            id: attributes.id,
            line: attributes.line,
            name: attributes.name,
            ship_type_id: attributes.ship_type_id
          }
        end

        def tier
          CosmeticSkinrTier.new(attributes: attributes.tier) if attributes.tier
        end

        def layout
          CosmeticSkinrLayout.new(attributes: attributes.layout) if attributes.layout
        end
      end
    end
  end
end

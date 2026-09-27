# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class CosmeticSkinrLayoutSlot < Object
        def as_json
          {
            id: attributes.id
          }
        end

        # @return [Hash] Raw configuration payload (nanocoating or pattern);
        #   intentionally left unparsed since it's polymorphic per slot type.
        def configuration
          attributes.configuration
        end
      end
    end
  end
end

# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class VictimItem < Object
        def as_json
          {
            flag: attributes.flag,
            item_type_id: attributes.item_type_id,
            quantity_destroyed: attributes.quantity_destroyed,
            quantity_dropped: attributes.quantity_dropped,
            singleton: attributes.singleton
          }
        end

        def items
          @items ||= Collection.from_array(attributes.items || [], type: VictimItem)
        end
      end
    end
  end
end

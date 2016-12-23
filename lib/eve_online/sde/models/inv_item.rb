module EveOnline
  module SDE
    module Models
      class InvItem
        attr_reader :data

        def initialize(data)
          @data = data
        end

        def as_json
          {
            flag_id: flag_id,
            item_id: item_id,
            location_id: location_id,
            owner_id: owner_id,
            quantity: quantity,
            type_id: type_id
          }
        end

        def flag_id
          data['flagID']
        end

        def item_id
          data['itemID']
        end

        def location_id
          data['locationID']
        end

        def owner_id
          data['ownerID']
        end

        def quantity
          data['quantity']
        end

        def type_id
          data['typeID']
        end
      end
    end
  end
end

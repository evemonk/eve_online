module EveOnline
  module SDE
    module Models
      class InvName
        attr_reader :data

        def initialize(data)
          @data = data
        end

        def as_json
          {
            item_id: item_id,
            item_name: item_name
          }
        end

        def item_id
          data['itemID']
        end

        def item_name
          data['itemName']
        end
      end
    end
  end
end

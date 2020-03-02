# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class AssetName < Base
        def as_json
          {
            item_id: item_id,
            name: name
          }
        end

        def item_id
          options["item_id"]
        end

        def name
          options["name"]
        end
      end
    end
  end
end

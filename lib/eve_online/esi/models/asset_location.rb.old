# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class AssetLocation < Base
        def as_json
          {
            item_id: item_id
          }
        end

        def item_id
          options["item_id"]
        end

        def position
          @position ||= Position.new(options["position"])
        end
      end
    end
  end
end

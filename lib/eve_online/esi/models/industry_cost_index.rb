# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class IndustryCostIndex < Object
        def as_json
          {
            activity: attributes.activity,
            cost_index: attributes.cost_index
          }
        end
      end
    end
  end
end

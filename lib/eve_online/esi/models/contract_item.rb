# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class ContractItem < Object
        def as_json
          {
            is_blueprint_copy: attributes.is_blueprint_copy,
            is_included: attributes.is_included,
            item_id: attributes.item_id,
            material_efficiency: attributes.material_efficiency,
            quantity: attributes.quantity,
            record_id: attributes.record_id,
            runs: attributes.runs,
            time_efficiency: attributes.time_efficiency,
            type_id: attributes.type_id
          }
        end
      end
    end
  end
end

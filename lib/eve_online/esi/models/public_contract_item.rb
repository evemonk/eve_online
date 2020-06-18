# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class PublicContractItem < Base
        def as_json
          {
            is_blueprint_copy: is_blueprint_copy,
            is_included: is_included,
            item_id: item_id,
            material_efficiency: material_efficiency,
            quantity: quantity,
            record_id: record_id,
            runs: runs,
            time_efficiency: time_efficiency,
            type_id: type_id
          }
        end

        def is_blueprint_copy
          options["is_blueprint_copy"]
        end

        def is_included
          options["is_included"]
        end

        def item_id
          options["item_id"]
        end

        def material_efficiency
          options["material_efficiency"]
        end

        def quantity
          options["quantity"]
        end

        def record_id
          options["record_id"]
        end

        def runs
          options["runs"]
        end

        def time_efficiency
          options["time_efficiency"]
        end

        def type_id
          options["type_id"]
        end
      end
    end
  end
end

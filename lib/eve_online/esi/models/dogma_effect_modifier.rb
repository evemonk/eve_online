# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class DogmaEffectModifier < Base
        def as_json
          {
            domain: domain,
            effect_id: effect_id,
            func: func,
            modified_attribute_id: modified_attribute_id,
            modifying_attribute_id: modifying_attribute_id,
            operator: operator
          }
        end

        def domain
          options["domain"]
        end

        def effect_id
          options["effect_id"]
        end

        def func
          options["func"]
        end

        def modified_attribute_id
          options["modified_attribute_id"]
        end

        def modifying_attribute_id
          options["modifying_attribute_id"]
        end

        def operator
          options["operator"]
        end
      end
    end
  end
end

# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class JumpClone < Object
        def as_json
          {
            implant_ids: implant_ids,
            jump_clone_id: attributes.jump_clone_id,
            location_id: attributes.location_id,
            location_type: attributes.location_type,
            name: attributes.name
          }
        end

        def implant_ids
          attributes.implants
        end
      end
    end
  end
end

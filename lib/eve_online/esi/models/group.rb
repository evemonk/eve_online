# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Group < Object
        def as_json
          {
            category_id: attributes.category_id,
            group_id: attributes.group_id,
            name: attributes.name,
            published: attributes.published
          }
        end

        def type_ids
          attributes.types || []
        end
      end
    end
  end
end

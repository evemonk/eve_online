# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Category < Object
        def as_json
          {
            category_id: attributes.category_id,
            name: attributes.name,
            published: attributes.published
          }
        end

        def group_ids
          attributes.groups || []
        end
      end
    end
  end
end

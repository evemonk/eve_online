# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Group < Base
        def as_json
          {
            category_id: category_id,
            group_id: group_id,
            name: name,
            published: published
          }
        end

        def category_id
          options["category_id"]
        end

        def group_id
          options["group_id"]
        end

        def name
          options["name"]
        end

        def published
          options["published"]
        end

        def type_ids
          options["types"]
        end
      end
    end
  end
end

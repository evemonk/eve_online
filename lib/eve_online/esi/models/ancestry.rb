# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Ancestry < Base
        def as_json
          {
            id: id,
            name: name,
            bloodline_id: bloodline_id,
            description: description,
            short_description: short_description,
            icon_id: icon_id
          }
        end

        def id
          options['id']
        end

        def name
          options['name']
        end

        def bloodline_id
          options['bloodline_id']
        end

        def description
          options['description']
        end

        def short_description
          options['short_description']
        end

        def icon_id
          options['icon_id']
        end
      end
    end
  end
end

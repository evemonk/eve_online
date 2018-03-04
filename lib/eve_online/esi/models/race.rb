# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Race < Base
        def as_json
          {
            race_id: race_id,
            name: name,
            description: description,
            alliance_id: alliance_id
          }
        end

        def race_id
          options['race_id']
        end

        def name
          options['name']
        end

        def description
          options['description']
        end

        def alliance_id
          options['alliance_id']
        end
      end
    end
  end
end

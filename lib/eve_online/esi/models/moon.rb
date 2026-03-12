# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Moon < Object
        def as_json
          {
            moon_id: attributes.moon_id,
            name: attributes.name,
            system_id: attributes.system_id
          }
        end

        def position
          @position ||= Position.new(attributes: attributes.position)
        end
      end
    end
  end
end

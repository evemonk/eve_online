# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Constellation < Base
        def as_json
          {
            constellation_id: constellation_id,
            name: name,
            region_id: region_id,
            systems: systems
          }
        end

        def constellation_id
          options['constellation_id']
        end

        def name
          options['name']
        end

        def region_id
          options['region_id']
        end

        def systems
          options['systems']
        end

        def position
          @position ||= Position.new(options['position'])
        end
      end
    end
  end
end

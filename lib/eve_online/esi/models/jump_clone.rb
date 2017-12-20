module EveOnline
  module ESI
    module Models
      class JumpClone < Base
        def as_json
          {
            jump_clone_id: jump_clone_id,
            name: name,
            location_id: location_id,
            location_type: location_type,
            implants: implants
          }
        end

        def jump_clone_id
          options['jump_clone_id']
        end

        def name
          options['name']
        end

        def location_id
          options['location_id']
        end

        def location_type
          options['location_type']
        end

        def implants
          options['implants']
        end
      end
    end
  end
end

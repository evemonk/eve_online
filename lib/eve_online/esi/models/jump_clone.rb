module EveOnline
  module ESI
    module Models
      class JumpClone < Base
        def as_json
          {
            location_id: location_id,
            location_type: location_type,
            implants: implants
          }
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

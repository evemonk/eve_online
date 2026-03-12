# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Star < Object
        def as_json
          {
            age: attributes.age,
            luminosity: attributes.luminosity,
            name: attributes.name,
            radius: attributes.radius,
            solar_system_id: attributes.solar_system_id,
            spectral_class: attributes.spectral_class,
            temperature: attributes.temperature,
            type_id: attributes.type_id
          }
        end
      end
    end
  end
end

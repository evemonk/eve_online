# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Star < Base
        def as_json
          {
            age: age,
            luminosity: luminosity,
            name: name,
            radius: radius,
            solar_system_id: solar_system_id,
            spectral_class: spectral_class,
            temperature: temperature,
            type_id: type_id
          }
        end

        def age
          options["age"]
        end

        def luminosity
          options["luminosity"]
        end

        def name
          options["name"]
        end

        def radius
          options["radius"]
        end

        def solar_system_id
          options["solar_system_id"]
        end

        def spectral_class
          options["spectral_class"]
        end

        def temperature
          options["temperature"]
        end

        def type_id
          options["type_id"]
        end
      end
    end
  end
end

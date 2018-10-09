# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Planets < Base
        def planets
          output = []

          options.each do |planet_short|
            output << PlanetShort.new(planet_short)
          end

          output
        end
      end
    end
  end
end

# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Planets < Base
        def planets
          output = []

          options.each do |planet|
            output << Planet.new(planet)
          end

          output
        end
      end
    end
  end
end

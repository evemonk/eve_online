# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Position < Base
        def as_json
          {
            x: x,
            y: y,
            z: z
          }
        end

        def x
          options["x"]
        end

        def y
          options["y"]
        end

        def z
          options["z"]
        end
      end
    end
  end
end

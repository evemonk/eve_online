# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Coordinates < Base
        def as_json
          {
            x: x,
            y: y,
            z: z
          }
        end

        # TODO: check 'options && '
        def x
          options && options["x"]
        end

        def y
          options && options["y"]
        end

        def z
          options && options["z"]
        end
      end
    end
  end
end

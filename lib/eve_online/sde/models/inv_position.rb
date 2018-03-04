# frozen_string_literal: true

module EveOnline
  module SDE
    module Models
      class InvPosition
        attr_reader :data

        def initialize(data)
          @data = data
        end

        def as_json
          {
            item_id: item_id,
            pitch: pitch,
            roll: roll,
            x: x,
            y: y,
            yaw: yaw,
            z: z
          }
        end

        def item_id
          data['itemID']
        end

        def pitch
          data['pitch']
        end

        def roll
          data['roll']
        end

        def x
          data['x']
        end

        def y
          data['y']
        end

        def yaw
          data['yaw']
        end

        def z
          data['z']
        end
      end
    end
  end
end

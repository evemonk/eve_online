# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Clones < Object
        def as_json
          {
            last_clone_jump_date: attributes.last_clone_jump_date,
            last_station_change_date: attributes.last_station_change_date
          }
        end

        def home_location
          @home_location ||= HomeLocation.new(attributes: attributes.home_location)
        end

        def jump_clones
          @jump_clones ||= Collection.from_array(attributes.jump_clones, type: JumpClone)
        end
      end
    end
  end
end

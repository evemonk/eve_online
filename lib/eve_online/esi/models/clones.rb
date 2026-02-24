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
      end
    end
  end
end

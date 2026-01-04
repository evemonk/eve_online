# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Defender < Base
        def as_json
          {
            alliance_id: alliance_id,
            corporation_id: corporation_id,
            isk_destroyed: isk_destroyed,
            ships_killed: ships_killed
          }
        end

        def alliance_id
          options["alliance_id"]
        end

        def corporation_id
          options["corporation_id"]
        end

        def isk_destroyed
          options["isk_destroyed"]
        end

        def ships_killed
          options["ships_killed"]
        end
      end
    end
  end
end

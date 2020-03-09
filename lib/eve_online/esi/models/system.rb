# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class System < Base
        def as_json
          {
            constellation_id: constellation_id,
            name: name,
            security_class: security_class,
            security_status: security_status,
            star_id: star_id,
            system_id: system_id
          }
        end

        def constellation_id
          options["constellation_id"]
        end

        def name
          options["name"]
        end

        def security_class
          options["security_class"]
        end

        def security_status
          options["security_status"]
        end

        def star_id
          options["star_id"]
        end

        def system_id
          options["system_id"]
        end

        def position
          @position ||= Position.new(options["position"])
        end

        def planets
          @planets ||= Planets.new(options.fetch("planets", [])).planets
        end

        def stargate_ids
          options.fetch("stargates", [])
        end

        def station_ids
          options.fetch("stations", [])
        end
      end
    end
  end
end

# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class SkyhookRaidable < Object
        def as_json
          {
            planet_id: attributes.planet_id,
            solar_system_id: attributes.solar_system_id
          }
        end

        def theft_vulnerability
          SkyhookTheftVulnerability.new(attributes: attributes.theft_vulnerability) if attributes.theft_vulnerability
        end
      end
    end
  end
end

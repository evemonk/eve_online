# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class IndustryFacility < Object
        def as_json
          {
            facility_id: attributes.facility_id,
            owner_id: attributes.owner_id,
            region_id: attributes.region_id,
            solar_system_id: attributes.solar_system_id,
            tax: attributes.tax,
            type_id: attributes.type_id
          }
        end
      end
    end
  end
end

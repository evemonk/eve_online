# frozen_string_literal: true

module EveOnline
  module ESI
    module Resources
      class PlanetaryInteractionResources < Resource
        # @param id [Integer] A schematic ID
        def schematic(id:)
          response = get_request("universe/schematics/#{id}")

          Models::PlanetarySchematic.new(attributes: response.body, headers: response.headers)
        end

        private

        def compatibility_date
          "2026-08-18"
        end
      end
    end
  end
end

# frozen_string_literal: true

module EveOnline
  module ESI
    module Resources
      class RoutesResource < Resource
        # @param destination_system_id [Integer] Destination system ID
        # @param origin_system_id [Integer] Origin system ID
        # @param avoid_systems_ids [Array<Integer>] Systems ID to avoid. Default: []
        def route(destination_system_id:, origin_system_id:, avoid_systems_ids: [])
        end

        private

        def compatibility_date
          "2025-12-16"
        end
      end
    end
  end
end

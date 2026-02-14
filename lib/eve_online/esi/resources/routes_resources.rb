# frozen_string_literal: true

module EveOnline
  module ESI
    module Resources
      class RoutesResources < Resource
        PREFERENCE = ["Shorter", "Safer", "LessSecure"]

        # @param destination_system_id [Integer] Destination system ID
        # @param origin_system_id [Integer] Origin system ID
        # @param preference [String] Preference for the route. One of: "Shorter", "Safer", "LessSecure". Default: "Shorter"
        # @param avoid_systems_ids [Array<Integer>] Systems ID to avoid. Default: []
        # @param security_penalty [Integer] Strictness of the path preference. Default: 50
        def route(destination_system_id:, origin_system_id:, preference: "Shorter", avoid_systems_ids: [], security_penalty: 50)

        end

        private

        def compatibility_date
          "2025-12-16"
        end
      end
    end
  end
end

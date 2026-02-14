# frozen_string_literal: true

module EveOnline
  module ESI
    module Resources
      class RoutesResources < Resource
        PREFERENCE = ["Shorter", "Safer", "LessSecure"]

        # @param origin_system_id [Integer] Origin system ID
        # @param destination_system_id [Integer] Destination system ID
        # @param preference [String] Preference for the route. One of: "Shorter", "Safer", "LessSecure". Default: "Shorter"
        # @param avoid_systems_ids [Array<Integer>] Systems ID to avoid. Default: []
        # @param security_penalty [Integer] Strictness of the path preference. Default: 50
        def route(origin_system_id:, destination_system_id:, preference: "Shorter", avoid_systems_ids: [], security_penalty: 50)
          response = post_request("route/#{origin_system_id}/#{destination_system_id}",
                                  params: {
                                    avoid_systems: avoid_systems_ids,
                                    preference: preference,
                                    security_penalty: security_penalty
                                  })

          Models::Route.new(attributes: response.body, headers: response.headers)
        end

        private

        def compatibility_date
          "2025-12-16"
        end
      end
    end
  end
end

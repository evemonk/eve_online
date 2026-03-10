# frozen_string_literal: true

module EveOnline
  module ESI
    module Resources
      class UniverseResources < Resource
        def ancestries
          response = get_request("universe/ancestries")

          Collection.from_response(response, type: Models::Ancestry)
        end

        def bloodlines
          response = get_request("universe/bloodlines")

          Collection.from_response(response, type: Models::Bloodline)
        end

        def factions
          response = get_request("universe/factions")

          Collection.from_response(response, type: Models::Faction)
        end

        def races
          response = get_request("universe/races")

          Collection.from_response(response, type: Models::Race)
        end

        def systems
          response = get_request("universe/systems")

          Models::Systems.new(body: response.body, headers: response.headers)
        end

        # @param id [Integer] Solar system ID
        def system(id:)
          response = get_request("universe/systems/#{id}")

          Models::System.new(attributes: response.body, headers: response.headers)
        end

        private

        def compatibility_date
          "2025-12-16"
        end
      end
    end
  end
end

# frozen_string_literal: true

module EveOnline
  module ESI
    module Resources
      class UniverseResource < Resource
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

        private

        def compatibility_date
          "2025-12-16"
        end
      end
    end
  end
end

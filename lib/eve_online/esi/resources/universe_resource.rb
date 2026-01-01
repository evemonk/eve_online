# frozen_string_literal: true

module EveOnline
  module ESI
    module Resources
      class UniverseResource < Resource
        def ancestries

        end

        def races
          response = get_request("universe/races")

          Collection.from_response(response, type: EveOnline::ESI::Models::Race)
        end

        private

        def compatibility_date
          "2025-12-16"
        end
      end
    end
  end
end

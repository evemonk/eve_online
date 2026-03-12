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

        # @param id [Integer] Station ID
        def station(id:)
          response = get_request("universe/stations/#{id}")

          Models::Station.new(attributes: response.body, headers: response.headers)
        end

        # @param id [Integer] Moon ID
        def moon(id:)
          response = get_request("universe/moons/#{id}")

          Models::Moon.new(attributes: response.body, headers: response.headers)
        end

        # @param id [Integer] Planet ID
        def planet(id:)
          response = get_request("universe/planets/#{id}")

          Models::Planet.new(attributes: response.body, headers: response.headers)
        end

        def regions
          response = get_request("universe/regions")
        end

        # @param id [Integer] Region ID
        def region(id:)
          response = get_request("universe/regions/#{id}")
        end

        # @param id [Integer] Star ID
        def star(id:)
          response = get_request("universe/stars/#{id}")
        end

        # @param id [Integer] Stargate ID
        def stargate(id:)
          response = get_request("universe/stargates/#{id}")
        end

        private

        def compatibility_date
          "2025-12-16"
        end
      end
    end
  end
end

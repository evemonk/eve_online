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

          Models::Regions.new(body: response.body, headers: response.headers)
        end

        # @param id [Integer] Region ID
        def region(id:)
          response = get_request("universe/regions/#{id}")

          Models::Region.new(attributes: response.body, headers: response.headers)
        end

        # @param id [Integer] Star ID
        def star(id:)
          response = get_request("universe/stars/#{id}")

          Models::Star.new(attributes: response.body, headers: response.headers)
        end

        # @param id [Integer] Stargate ID
        def stargate(id:)
          response = get_request("universe/stargates/#{id}")

          Models::Stargate.new(attributes: response.body, headers: response.headers)
        end

        # @param id [Integer] Asteroid belt ID
        def asteroid_belt(id:)
          response = get_request("universe/asteroid_belts/#{id}")

          Models::AsteroidBelt.new(attributes: response.body, headers: response.headers)
        end

        def constellations
          response = get_request("universe/constellations")

          Models::Constellations.new(body: response.body, headers: response.headers)
        end

        private

        def compatibility_date
          "2025-12-16"
        end
      end
    end
  end
end

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

        # @param id [Integer] Constellation ID
        def constellation(id:)
          response = get_request("universe/constellations/#{id}")

          Models::Constellation.new(attributes: response.body, headers: response.headers)
        end

        # @param page [Integer] Page number (default: 1)
        def groups(page: 1)
          response = get_request("universe/groups",
            params: {
              page: page
            })

          Models::Groups.new(body: response.body, headers: response.headers)
        end

        # @param id [Integer] Group ID
        def group(id:)
          response = get_request("universe/groups/#{id}")

          Models::Group.new(attributes: response.body, headers: response.headers)
        end

        def categories
          response = get_request("universe/categories")

          Models::Categories.new(body: response.body, headers: response.headers)
        end

        # @param id [Integer] Category ID
        def category(id:)
          response = get_request("universe/categories/#{id}")

          Models::Category.new(attributes: response.body, headers: response.headers)
        end

        def graphics
          response = get_request("universe/graphics")

          Models::Graphics.new(body: response.body, headers: response.headers)
        end

        # @param id [Integer] Graphic ID
        def graphic(id:)
          response = get_request("universe/graphics/#{id}")

          Models::Graphic.new(attributes: response.body, headers: response.headers)
        end

        # @param page [Integer] Page number (default: 1)
        def types(page: 1)
          response = get_request("universe/types",
            params: {
              page: page
            })

          Models::Types.new(body: response.body, headers: response.headers)
        end

        # @param id [Integer] Type ID
        def type(id:)
          response = get_request("universe/types/#{id}")

          Models::Type.new(attributes: response.body, headers: response.headers)
        end

        # @param filter [String] Filter by service (optional). Default: nil (all services). Valid values: "market" and "manufacturing_basic".
        def structures(filter: nil)
          response = get_request("universe/structures",
            params: {
              filter: filter
            }.compact)

          Models::Structures.new(body: response.body, headers: response.headers)
        end

        private

        def compatibility_date
          "2025-12-16"
        end
      end
    end
  end
end

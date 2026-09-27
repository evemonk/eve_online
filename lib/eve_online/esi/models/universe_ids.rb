# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class UniverseIds < Object
        def agents
          Collection.from_array(attributes.agents || [], type: IdName)
        end

        def alliances
          Collection.from_array(attributes.alliances || [], type: IdName)
        end

        def characters
          Collection.from_array(attributes.characters || [], type: IdName)
        end

        def constellations
          Collection.from_array(attributes.constellations || [], type: IdName)
        end

        def corporations
          Collection.from_array(attributes.corporations || [], type: IdName)
        end

        def factions
          Collection.from_array(attributes.factions || [], type: IdName)
        end

        def inventory_types
          Collection.from_array(attributes.inventory_types || [], type: IdName)
        end

        def regions
          Collection.from_array(attributes.regions || [], type: IdName)
        end

        def stations
          Collection.from_array(attributes.stations || [], type: IdName)
        end

        def systems
          Collection.from_array(attributes.systems || [], type: IdName)
        end
      end
    end
  end
end

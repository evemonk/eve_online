# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class ParagonHubSkinrListings < Object
        def cursor
          ParagonHubSkinrCursor.new(attributes: attributes.cursor) if attributes.cursor
        end

        def listings
          Collection.from_array(attributes.listings || [], type: ParagonHubSkinrListing)
        end
      end
    end
  end
end

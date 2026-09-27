# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class SkyhooksRaidableListing < Object
        def skyhooks
          Collection.from_array(attributes.skyhooks || [], type: SkyhookRaidable)
        end
      end
    end
  end
end

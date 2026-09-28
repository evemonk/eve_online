# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class MilitaryCampaignObjectivesListing < Object
        def cursor
          MilitaryCampaignObjectivesCursor.new(attributes: attributes.cursor) if attributes.cursor
        end

        def objectives
          Collection.from_array(attributes.objectives || [], type: MilitaryCampaignObjective)
        end
      end
    end
  end
end

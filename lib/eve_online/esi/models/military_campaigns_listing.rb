# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class MilitaryCampaignsListing < Object
        def campaigns
          Collection.from_array(attributes.campaigns || [], type: MilitaryCampaign)
        end
      end
    end
  end
end

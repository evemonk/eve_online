# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class SovereigntyCampaignParticipant < Object
        def as_json
          {
            alliance_id: attributes.alliance_id,
            score: attributes.score
          }
        end
      end
    end
  end
end

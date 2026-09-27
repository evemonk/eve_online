# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class MilitaryCampaignObjectiveParticipants < Object
        def as_json
          {
            committed: attributes.committed,
            contributors: attributes.contributors,
            total: attributes.total
          }
        end
      end
    end
  end
end

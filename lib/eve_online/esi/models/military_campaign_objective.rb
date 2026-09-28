# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class MilitaryCampaignObjective < Object
        def as_json
          {
            finished: attributes.finished,
            id: attributes.id,
            last_modified: attributes.last_modified,
            progress: attributes.progress,
            started: attributes.started,
            state: attributes.state
          }
        end

        def participants
          MilitaryCampaignObjectiveParticipants.new(attributes: attributes.participants) if attributes.participants
        end
      end
    end
  end
end

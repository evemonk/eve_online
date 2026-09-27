# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class MilitaryCampaign < Object
        def as_json
          {
            finished: attributes.finished,
            id: attributes.id,
            progress: attributes.progress,
            started: attributes.started,
            state: attributes.state
          }
        end
      end
    end
  end
end

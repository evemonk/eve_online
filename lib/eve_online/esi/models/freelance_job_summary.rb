# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class FreelanceJobSummary < Object
        def as_json
          {
            id: attributes.id,
            last_modified: attributes.last_modified,
            name: attributes.name,
            state: attributes.state
          }
        end

        def progress
          FreelanceJobProgress.new(attributes: attributes.progress) if attributes.progress
        end

        def reward
          FreelanceJobReward.new(attributes: attributes.reward) if attributes.reward
        end
      end
    end
  end
end

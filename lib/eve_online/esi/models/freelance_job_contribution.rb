# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class FreelanceJobContribution < Object
        def as_json
          {
            contribution_per_participant_limit: attributes.contribution_per_participant_limit,
            max_committed_participants: attributes.max_committed_participants,
            reward_per_contribution: attributes.reward_per_contribution,
            submission_limit: attributes.submission_limit,
            submission_multiplier: attributes.submission_multiplier
          }
        end
      end
    end
  end
end

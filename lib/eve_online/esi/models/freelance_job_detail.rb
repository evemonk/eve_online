# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class FreelanceJobDetail < Object
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

        def details
          FreelanceJobDetails.new(attributes: attributes.details) if attributes.details
        end

        def contribution
          FreelanceJobContribution.new(attributes: attributes.contribution) if attributes.contribution
        end

        def access_and_visibility
          FreelanceJobAccessAndVisibility.new(attributes: attributes.access_and_visibility) if attributes.access_and_visibility
        end

        # @return [Hash] Raw configuration payload (method/version/parameters);
        #   parameters are polymorphic per method and intentionally left unparsed.
        def configuration
          attributes.configuration
        end
      end
    end
  end
end

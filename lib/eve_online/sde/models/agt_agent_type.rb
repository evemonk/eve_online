# frozen_string_literal: true

module EveOnline
  module SDE
    module Models
      class AgtAgentType
        attr_reader :data

        def initialize(data)
          @data = data
        end

        def as_json
          {
            agent_type: agent_type,
            agent_type_id: agent_type_id
          }
        end

        def agent_type
          data['agentType']
        end

        def agent_type_id
          data['agentTypeID']
        end
      end
    end
  end
end

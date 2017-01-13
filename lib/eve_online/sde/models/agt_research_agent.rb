module EveOnline
  module SDE
    module Models
      class AgtResearchAgent
        attr_reader :data

        def initialize(data)
          @data = data
        end

        def as_json
          {
            agent_id: agent_id,
            type_id: type_id
          }
        end

        def agent_id
          data['agentID']
        end

        def type_id
          data['typeID']
        end
      end
    end
  end
end

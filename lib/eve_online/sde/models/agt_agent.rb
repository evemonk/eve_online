# frozen_string_literal: true

module EveOnline
  module SDE
    module Models
      class AgtAgent
        attr_reader :data

        def initialize(data)
          @data = data
        end

        def as_json
          {
            agent_id: agent_id,
            agent_type_id: agent_type_id,
            corporation_id: corporation_id,
            division_id: division_id,
            is_locator: is_locator,
            level: level,
            location_id: location_id,
            quality: quality
          }
        end

        def agent_id
          data['agentID']
        end

        def agent_type_id
          data['agentTypeID']
        end

        def corporation_id
          data['corporationID']
        end

        def division_id
          data['divisionID']
        end

        def is_locator
          data['isLocator']
        end

        def level
          data['level']
        end

        def location_id
          data['locationID']
        end

        def quality
          data['quality']
        end
      end
    end
  end
end

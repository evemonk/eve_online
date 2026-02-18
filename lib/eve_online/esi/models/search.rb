# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Search < Object
        def as_json
          {
            agent_ids: agent_ids,
            alliance_ids: alliance_ids
          }
        end

        def agent_ids
          attributes.agent || []
        end

        def alliance_ids
          attributes.alliance || []
        end
      end
    end
  end
end

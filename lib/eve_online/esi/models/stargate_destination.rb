# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class StargateDestination < Base
        def as_json
          {
            stargate_id: stargate_id,
            system_id: system_id
          }
        end

        def stargate_id
          options['stargate_id']
        end

        def system_id
          options['system_id']
        end
      end
    end
  end
end

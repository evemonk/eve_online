# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Ally < Base
        def as_json
          {
            alliance_id: alliance_id,
            corporation_id: corporation_id
          }
        end

        def alliance_id
          options["alliance_id"]
        end

        def corporation_id
          options["corporation_id"]
        end
      end
    end
  end
end

# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class AllianceShort < Base
        def as_json
          {
            alliance_id: alliance_id,
            alliance_name: alliance_name
          }
        end

        def alliance_id
          options["alliance_id"]
        end

        def alliance_name
          options["alliance_name"]
        end
      end
    end
  end
end

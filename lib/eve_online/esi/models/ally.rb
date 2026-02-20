# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Ally < Object
        def as_json
          {
            alliance_id: attributes.alliance_id,
            corporation_id: attributes.corporation_id
          }
        end
      end
    end
  end
end

# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class FactionWarfareStatSummary < Object
        def as_json
          {
            last_week: attributes.last_week,
            total: attributes.total,
            yesterday: attributes.yesterday
          }
        end
      end
    end
  end
end

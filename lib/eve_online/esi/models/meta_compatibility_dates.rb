# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class MetaCompatibilityDates < Object
        def as_json
          {
            compatibility_dates: compatibility_dates
          }
        end

        def compatibility_dates
          attributes.compatibility_dates
        end
      end
    end
  end
end

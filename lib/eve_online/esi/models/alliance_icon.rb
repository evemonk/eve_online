# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class AllianceIcon < Base
        def as_json
          {
            icon_medium: icon_medium,
            icon_small: icon_small
          }
        end

        def icon_medium
          options['px128x128']
        end

        def icon_small
          options['px64x64']
        end
      end
    end
  end
end

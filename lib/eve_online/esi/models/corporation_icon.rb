# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class CorporationIcon < Object
        def as_json
          {
            icon_large: icon_large,
            icon_medium: icon_medium,
            icon_small: icon_small
          }
        end

        def icon_large
          attributes["px256x256"]
        end

        def icon_medium
          attributes["px128x128"]
        end

        def icon_small
          attributes["px64x64"]
        end
      end
    end
  end
end

# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class AllianceIcon < Base
        def as_json
          {
            small: small,
            medium: medium
          }
        end

        def small
          options['px64x64']
        end

        def medium
          options['px128x128']
        end
      end
    end
  end
end

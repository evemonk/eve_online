# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class CharacterPortrait < Base
        def as_json
          {
            medium: medium,
            large: large,
            huge: huge,
            small: small
          }
        end

        def medium
          options["px128x128"]
        end

        def large
          options["px256x256"]
        end

        def huge
          options["px512x512"]
        end

        def small
          options["px64x64"]
        end
      end
    end
  end
end
